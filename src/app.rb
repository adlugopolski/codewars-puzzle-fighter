# frozen_string_literal: true

require "forwardable"

ERANGE = (0..Float::INFINITY).freeze

module ArrayExtensions
  refine Array do
    def unwords
      join(" ")
    end

    def unlines
      join("\n")
    end

    def unpipes
      join("|")
    end
  end
end

class Object
  def if_none
    if nil?
      yield if block_given?
    else
      self
    end
  end

  def then(*args, &block)
    block.call(self, *args)
  end
end


class BaseScaffold
  def self.call(*args, &block)
    new(*args).call(&block)
  end

  def self.to_proc
    proc(&method(:call))
  end
end

# require_relative "debug.rb"

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
    @_result ||= @input.reduce([]) do |state, step|
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
      .then(&PowerCombiner)
      .then(&PowerMerger)
      .then(&PowerExpander)
  end

  private

  def logic
    crashes.reduce(@blocks) do |board, crash|
      target = board.sort.reverse.detect { |block| block.kind == crash.kind }

      board
        .then(target, &Crash)
        .then(&PowerCombiner)
        .then(&PowerMerger)
        .then(&PowerExpander)
        .then(&Gravity)
    end
  end

  def crashes
    @blocks.select(&:crash?).sort.reverse
  end
end

class HistogramArea < BaseScaffold
  def initialize(row)
    @row = row
  end

  # This is O(N^2)
  def call
    subrows
      .select { |group| group[:size] >= 4 }
      .select { |group| group[:positions].size >= 2 }
      .select { |group| group[:values].min >= 2 }
      .max_by { |group| [group[:size], group[:positions].size] }
  end

  def subrows
    (0..@row.size).flat_map do |index|
      index.upto(@row.size - 1).map do |position|
        subrow = @row[index..position]
        {
          size: subrow.size * subrow.min,
          positions: Array(index..position),
          values: subrow,
        }
      end
    end
  end
end

class PowerMerger < BaseScaffold
  def initialize(blocks)
    @blocks = Board.new(blocks)
  end

  def call
    %w[R G B Y].reduce(@blocks) do |blocks, color|
      process_color(blocks, color)
    end
  end

  def process_color(state, color)
    ERANGE.reduce(state) do |board, _|
      new_board = merge(color, board)

      break board if new_board.power_count == board.power_count

      new_board
    end
  end

  def merge(color, state)
    filtered_blocks = state.power_blocks(color).combination(2)

    filtered_blocks.reduce(state) do |board, pair|
      power = Power.call(pair.flatten, color)
      if pair.flatten.sort == power.sort
        break Board.new(
          board.minus(power) + power.map do |block|
            block.copy(power: board.power_count)
          end
        )
      else
        board
      end
    end
  end
end

class PowerExpander < BaseScaffold
  def initialize(blocks)
    @blocks = Board.new(blocks)
  end

  def call
    %w[R G B Y].reduce(@blocks) do |blocks, color|
      expand(blocks, color)
    end
  end

  def expand(state, color)
    state.power_blocks(color).reduce(state) do |board, power_block|
      test_board =
        board.minus(state.power_blocks(color).flatten) + power_block
      new_power = Board.new Power.call(test_board, color)

      if new_power.size > power_block.size && new_power.contains?(power_block)
        Board.new(
          board.minus(new_power) + new_power.map do |block|
            block.copy(power: board.power_count)
          end
        )
      else
        board
      end
    end
  end
end

class PowerCombiner < BaseScaffold
  def initialize(blocks)
    @blocks = Board.new(blocks)
  end

  def call
    %w[R G B Y].reduce(@blocks) do |blocks, color|
      mark_power_gems(blocks, color)
    end
  end

  private

  def mark_power_gems(board, color)
    ERANGE.reduce(board) do |blocks, _|
      power = Power.call(blocks.unpowered, color)

      break blocks if power.empty?

      result = blocks.minus(power) + power.map do |block|
        block.copy(power: blocks.power_count)
      end

      Board.new(result)
    end
  end
end

class Power < BaseScaffold
  def initialize(blocks, color)
    @color = color
    @blocks = Board.new(
      blocks
      .select { |block| block.kind? Block.new(color, 0, 0) }
        .sort
    )
  end

  def call
    find_power_block
  end

  private

  def find_power_block
    possible_blocks
      .sort
      .group_by(&:y)
      .map { |y, row| [y, kinds_with_gaps(row)] }
      .map { |y, row| [y, HistogramArea.call(row)] }
      .reject { |_, row| row.nil? }
      .max_by { |_, row| row[:size] }
      .then(&format_block_coords)
      .map { |x, y| @blocks.at(x, y) }
  end

  def format_block_coords
    lambda do |(row, result)|
      return [] unless result

      (row - result[:values].min + 1 .. row).flat_map do |index|
        result[:positions].zip Array.new(result[:values].size, index)
      end
    end
  end

  def possible_blocks
    @blocks.each_with_object(Board.new) do |block, memo|
      upper_block = memo.at(block.x, block.y - 1) || Block.new(0, 0, 0)
      memo.append block.copy(kind: upper_block.kind + 1)
    end
  end

  def kinds_with_gaps(row)
    (0..5).map do |x|
      found = row.detect { |block| block.x == x } || Block.new(0, x, 0)
      found.kind
    end
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
    return unless current.kind?(crash)

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
  def self.to_proc
    proc(&method(:new))
  end

  def initialize(blocks = [])
    super(blocks)
  end

  def minus(elements)
    reject do |current|
      Array(elements).include?(current)
    end
  end

  def contains?(elements)
    elements.all? do |element|
      at(element.x, element.y)
    end
  end

  def at(x, y)
    detect { |block| block.x == x && block.y == y }
  end

  def power(id)
    Board.new(select { |block| block.power == id })
  end

  def unpowered
    Board.new(select(&:power_zero?))
  end

  def power_count
    group_by(&:power)
      .keys
      .max
      .next
  end

  def hanging?(block)
    supporting = select do |member|
      member.x == block.x && member.y > block.y
    end

    supporting.size < 11 - block.y
  end

  def hanging_blocks
    Board.new select(&method(:hanging?)) - static_power_blocks.flatten
  end

  def hanging_power_blocks
    power_blocks.reject(&method(:power_block_static?))
  end

  def static_power_blocks
    power_blocks.select(&method(:power_block_static?))
  end

  def power_block_static?(elements)
    row_number, lowest_row = elements.group_by(&:y).max_by(&:first)
    columns = lowest_row.map(&:x)

    select { |block| block.y > row_number }
      .select { |block| block.x.between?(columns.min, columns.max) }
      .group_by(&:x)
      .map { |_, value| value.count }
      .select { |value| value == 11 - row_number }
      .then { |result| result.any? || row_number == 11 }
  end

  def power_blocks(filter = %w[R B G Y])
    select(&:power_positive?)
      .select { |block| Array(filter).include?(block.kind) }
      .group_by(&:power)
      .values
  end
end

class Gravity < BaseScaffold
  def initialize(blocks)
    @blocks = Board.new(blocks.map(&:copy))
  end

  def call
    hanging_queue.reduce(@blocks) do |result, block|
      Board.new(Inject.call(result.minus(block), block))
    end
  end

  private

  def hanging_queue
    (@blocks.hanging_power_blocks + hanging_blocks)
      .sort_by(&:first)
      .reverse
  end

  def non_power_hanging_blocks
    @blocks.hanging_blocks - @blocks.hanging_power_blocks.flatten
  end

  def hanging_blocks
    @_hanging_blocks ||= non_power_hanging_blocks.map do |block|
      [block]
    end
  end
end

class Inject < BaseScaffold
  def initialize(blocks, new_blocks)
    @blocks = blocks.map(&:copy)
    @new_blocks = Array(new_blocks).reverse
  end

  def call
    @new_blocks.reduce(@blocks) do |state, block|
      state << block.copy(y: highest_of_lowest - diff_y[block.y])
    end
  end

  private

  def diff_y
    @_diff_y ||=
      @new_blocks
      .group_by(&:y)
      .keys
      .map
      .with_index(0)
      .reduce({}) { |memo, (y, index)| memo.merge(y => index) }
  end

  def highest_of_lowest
    @_highest_of_lowest ||=
      @new_blocks
      .group_by(&:y)
      .max_by(&:last)
      .last
      .map { |check| lowest_in_column(check) }
      .min
  end

  def lowest_in_column(check)
    found_block =
      @blocks
      .select { |block| block.x == check.x }
      .select { |block| block.y > check.y }
      .min_by(&:y)

    found_block ||= Block.new("?", 0, 12)
    found_block.y - 1
  end
end

class Block
  extend Forwardable
  attr_reader :x, :y, :kind, :power

  def_delegator :power, :zero?, :power_zero?
  def_delegator :power, :positive?, :power_positive?

  def initialize(kind, x, y, power = 0)
    @kind = kind
    @x = x
    @y = y
    @power = power
  end

  def copy(kind: self.kind, x: self.x, y: self.y, power: self.power)
    Block.new(kind, x, y, power)
  end

  def draw_on(template)
    board = template.map(&:dup)
    board[y][x] =
      if block_given?
        yield block
      else
        kind.to_s[0]
      end
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

  def kind?(other)
    other.kind[0].to_s.downcase == kind[0].to_s.downcase
  end

  def outside?
    !(0..11).include?(x) || !(0..11).include?(y)
  end

  def overlap?(other)
    x == other.x && y == other.y
  end

  def ==(other)
    x == other.x && y == other.y && kind?(other)
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
      InitialRotator.call(@step).reduce(@state) do |state, block|
        Inject.call(state, block)
      end
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
    @pair.blocks.sort.reverse
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
    ["BB", "LLLL"],
    ["BB", "LL"],
    ["BB", "L"],
    ["BB", "LLL"],
    ["BB", "LL"],
    ["BG", "L"],
    ["BB", ""],
    ["BB", "R"],
    ["RB", "BBRRR"],
    ["RR", "LLL"],
    ["RR", "BALL"],
    ["RR", ""],
    ["RR", "R"],
    ["RR", "L"],
    ["RR", "B"],
    ["RR", "LLL"],
    ["RR", "LL"],
    ["RR", "BLLL"],
    ["RR", "B"],
    ["YR", "ALL"],
    ["GR", "AL"],
    ["Rb", "RRRR"],
  ]

  PuzzleFighter.call(instructions) do |fighter|
    puts DebugRun.call(fighter, ARGV[0])
  end
end
