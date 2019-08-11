# frozen_string_literal: true

require_relative "debug.rb"

class BaseScaffold
  def self.call(*args)
    new(*args).call
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
    @input.reduce(initial_state) do |state, step|
      MainLoop.call(state, step)
    end
  end

  def initial_state
    Array.new(12, "      ")
  end

  def output_format
    process_input.join("\n")
  end
end

class MainLoop < BaseScaffold
  def initialize(state, step)
    self.state = state
    self.step = step
  end

  def call
    state
  end

  private

  attr_accessor :state, :step
end

class InitialRotator < BaseScaffold
  class Block
    attr_reader :x, :y, :kind

    def initialize(kind, x, y)
      @kind = kind
      @x = x
      @y = y
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
  end

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

    def to_s
      @block2.draw_on(
        @block1.draw_on(
          ["      ", "      "],
        ),
      )
    end

    private

    def leftmost
      @block1 << @block2
    end
  end

  def initialize(action)
    @blocks, @moves = action
  end

  def call
    set_starting_position
    perform_moves
    Pair.new(*@state).to_s
  end

  private

  def set_starting_position
    @state = [
      Block.new(@blocks[0], 3, 0),
      Block.new(@blocks[1], 3, 1),
    ]
  end

  def perform_moves
    @moves.chars.each do |move|
      case move
      when "L"
        @state = Pair.new(*@state).move_left
      when "R"
      when "A"
      when "B"
      else
        raise ArgumentError, invalid_move_error_message
      end
    end
  end

  def invalid_move_error_message
    format("Invalid move %s for blocks: %s", @blocks, @move)
  end
end

def puzzle_fighter(instructions)
  PuzzleFighter.call(instructions)
end
