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
    process_input
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

def puzzle_fighter(instructions)
  PuzzleFighter.call(instructions)
end
