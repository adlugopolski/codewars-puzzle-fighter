class BaseScaffold
  def self.call(*args)
    new(*args).call
  end
end

class PuzzleFighter < BaseScaffold
  def initialize(input)
    self.input = input
  end

  def call
    input.reduce([]) do |state, step|
      MainLoop.call(state, step)
    end
  end

  private

  attr_accessor :input
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

