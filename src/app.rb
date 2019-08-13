# frozen_string_literal: true

require_relative "debug.rb"

class BaseScaffold
  def self.call(*args, &block)
    new(*args).call(&block)
  end
end

class FormatOutput < BaseScaffold
  def initialize(blocks, rows = 12)
    @blocks = blocks
    @rows = rows
  end

  def call
    @blocks.reduce(template) do |board, block|
      block.draw_on(board)
    end
  end

  private

  def template
    Array.new(@rows, "      ")
  end
end

class PuzzleFighter < BaseScaffold
  attr_reader :debug, :input

  def initialize(input)
    @input = input
    @debug = []
  end

  def call
    result
    yield self if block_given?
    output_format
  end

  private

  def result
    @_result ||= @input.each_with_index.reduce([]) do |state, (step, _counter)|
      MainLoop.call(state, step).tap do |nstate|
        @debug << nstate
      end
    end
  end

  def output_format
    FormatOutput.call(result, 12).join("\n")
  end
end

class Effects < BaseScaffold
  def initialize(blocks)
    @blocks = blocks.map(&:copy)
  end

  def call
    logic
  end

  private

  def logic
    crashes.reduce(@blocks) do |board, crash|
      target = board.sort.reverse.detect { |block| block.kind == crash.kind }
      Gravity.call Crash.call(board, target)
    end
  end

  def crashes
    @blocks.select(&:crash?).sort.reverse
  end
end

class Crash < BaseScaffold
  def initialize(blocks, crash)
    @blocks = blocks.map(&:copy)
    @crash = crash.copy
    @remove = []
  end

  def call
    traverse(@crash, :none)
    if @remove.size > 1
      @blocks - @remove
    else
      @blocks
    end
  end

  private

  def traverse(crash, from)
    return if crash.outside?
    return unless (current = block_present?(crash))
    return if @remove.detect { |block| block.overlap?(crash) }
    return if crash.kind != current.kind.downcase

    @remove << current

    traverse(crash.up, :up) unless from == :down
    traverse(crash.left, :left) unless from == :right
    traverse(crash.down, :down) unless from == :up
    traverse(crash.right, :right) unless from == :left
  end

  def block_present?(crash)
    @blocks.detect { |block| block.overlap?(crash) }
  end
end

class Board < Array
  def initialize(blocks)
    super(blocks)
  end

  def hanging?(block)
    supporting = select do |member|
      member.x == block.x && member.y > block.y
    end

    supporting.size < 11 - block.y
  end

  def hanging_blocks
    select(&method(:hanging?))
  end
end

class Gravity < BaseScaffold
  def initialize(blocks)
    @blocks = Board.new(blocks.map(&:copy))
  end

  def call
    Inject.call(@blocks - hanging_blocks, hanging_blocks.sort)
  end

  private

  def hanging_blocks
    @_hanging_blocks ||= @blocks.hanging_blocks
  end
end

class Inject < BaseScaffold
  class NullBlock
    def y
      12
    end
  end

  def initialize(blocks, new_blocks)
    @blocks = blocks.map(&:copy)
    @new_blocks = new_blocks
  end

  def call
    @new_blocks.reverse.each do |block|
      @blocks << block.copy(y: lowest_in_column(block.x))
    end
    @blocks
  end

  private

  def lowest_in_column(column)
    found_block =
      @blocks
      .select { |block| block.x == column }
      .min_by(&:y)

    found_block ||= NullBlock.new
    found_block.y - 1
  end
end

class Block
  attr_reader :x, :y, :kind

  def initialize(kind, x, y)
    @kind = kind
    @x = x
    @y = y
  end

  def copy(kind: self.kind, x: self.x, y: self.y)
    Block.new(kind, x, y)
  end

  def draw_on(template)
    board = template.map(&:dup)
    board[y][x] = kind
    board
  end

  def left
    Block.new(kind, [0, x - 1].max, y)
  end

  def right
    Block.new(kind, [5, x + 1].min, y)
  end

  def up
    Block.new(kind, x, y - 1)
  end

  def down
    Block.new(kind, x, y + 1)
  end

  def crash?
    ("a".."z").include?(kind)
  end

  def outside?
    !(0..11).include?(x) || !(0..11).include?(y)
  end

  def overlap?(other)
    x == other.x && y == other.y
  end

  def ==(other)
    x == other.x && y == other.y && kind == other.kind
  end

  def <=>(other)
    return 0 if other == self

    if y > other.y
      1
    elsif y < other.y
      -1
    elsif x > other.x
      1
    else
      -1
    end
  end

  def >>(other)
    if x >= other.x
      self
    else
      other
    end
  end

  def <<(other)
    if x <= other.x
      self
    else
      other
    end
  end

  def >=(other)
    if y >= other.y
      self
    else
      other
    end
  end

  def <=(other)
    if y <= other.y
      self
    else
      other
    end
  end
end

class MainLoop < BaseScaffold
  def initialize(state, step)
    @state = state
    @step = step
  end

  def call
    Effects.call(
      Inject.call(@state, InitialRotator.call(@step))
    )
  end
end

class InitialRotator < BaseScaffold
  class Pair
    def initialize(block1, block2)
      @block1 = block1
      @block2 = block2
    end

    def move_left
      if leftmost.left == leftmost
        [@block1, @block2]
      else
        [@block1.left, @block2.left]
      end
    end

    def move_right
      if rightmost.right == rightmost
        [@block1, @block2]
      else
        [@block1.right, @block2.right]
      end
    end

    def horizontal?
      @block1.y == @block2.y
    end

    def center_top?
      @block1 == @block1 <= @block2
    end

    def center_left?
      @block1 == @block1 << @block2
    end

    def rotate_clockwise
      if horizontal?
        if center_left?
          [@block1, @block2.left.down]
        else
          [@block1, @block2.right.up]
        end
      elsif center_top?
        [@block1, @block2.left.up]
      else
        [@block1, @block2.right.down]
      end
    end

    def rotate_anticlockwise
      if horizontal?
        if center_left?
          [@block1, @block2.left.up]
        else
          [@block1, @block2.right.down]
        end
      elsif center_top?
        [@block1, @block2.right.up]
      else
        [@block1, @block2.left.down]
      end
    end

    def blocks
      [@block1, @block2]
    end

    def to_a
      @block2.draw_on(
        @block1.draw_on(
          ["      ", "      "],
        ),
      )
    end

    def adjust_negatives
      return self if @block1.y >= 0 && @block2.y >= 0

      Pair.new(
        Block.new(@block1.kind, @block1.x, @block1.y + 1),
        Block.new(@block2.kind, @block2.x, @block2.y + 1),
      )
    end

    private

    def leftmost
      @block1 << @block2
    end

    def rightmost
      @block1 >> @block2
    end
  end

  def initialize(action)
    blocks, @moves = action

    @pair = Pair.new(
      Block.new(blocks[0], 3, 0),
      Block.new(blocks[1], 3, 1),
    )
  end

  def call
    perform_moves
    adjust_negatives
    @pair.blocks.sort
  end

  private

  def perform_moves
    @moves.chars.each do |move|
      @pair =
        case move
        when "L"
          Pair.new(*@pair.move_left)
        when "R"
          Pair.new(*@pair.move_right)
        when "A"
          Pair.new(*@pair.rotate_anticlockwise)
        when "B"
          Pair.new(*@pair.rotate_clockwise)
        else
          raise ArgumentError, invalid_move_error_message
        end
    end
  end

  def adjust_negatives
    @pair = @pair.adjust_negatives
  end

  def invalid_move_error_message
    format("Invalid move %s for blocks: %s", @blocks, @move)
  end
end

def puzzle_fighter(instructions)
  PuzzleFighter.call(instructions)
end

if $PROGRAM_NAME == __FILE__
  instructions = [
    ["RR", "LLL"],
    ["GG", "LL"],
    ["RG", "BBL"],
    ["GY", "AR"],
    ["RR", "BBLLL"],
    ["RB", "AALL"],
    ["GR", "B"],
    ["GB", "AR"],
    ["RR", ""],
    ["GG", "R"],
    ["YR", "BR"],
    ["RR", "LLL"],
    ["BR", "AALL"],
    ["Bg", ""],
    ["RR", "BBBBLLL"],
    ["GR", "ALLL"],
    ["bR", "L"],
    ["YG", "BBBALL"],
    ["RR", "L"],
    ["YB", "AL"],
  ]

  PuzzleFighter.call(instructions) do |fighter|
    puts DebugRun.call(fighter)
  end
end
