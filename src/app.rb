# frozen_string_literal: true

require_relative "debug.rb"

class BaseScaffold
  def self.call(*args)
    new(*args).call
  end
end

class FormatOutput < BaseScaffold
  def initialize(blocks, rows)
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
  def initialize(input)
    @input = input
  end

  def call
    output_format
  end

  private

  def process_input
    @input.each_with_index.reduce([]) do |state, (step, _counter)|
      # break state if _counter == 5

      MainLoop.call(state, step)
    end
  end

  def output_format
    FormatOutput.call(process_input, 12).join("\n")
  end
end

class Board
  class NullBlock
    def y
      12
    end
  end

  def initialize(blocks = [])
    @blocks = blocks
  end

  def insert(new_blocks)
    new_blocks.reverse.each do |block|
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

  def ==(other)
    x == other.x && y == other.y && kind == other.kind
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
    Board.new(@state).insert InitialRotator.call(@step)
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
    @pair.blocks
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
