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
    Array.new(12, " " * 6)
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
  def initialize(action)
    @blocks, @move = action
    @template = Array.new(2, " " * 6)
  end

  def call
    set_starting_position
    @template
  end

  private

  def set_starting_position
    @template[0][3] = @blocks[0]
    @template[1][3] = @blocks[1]
  end
end

def puzzle_fighter(instructions)
  PuzzleFighter.call(instructions)
end
