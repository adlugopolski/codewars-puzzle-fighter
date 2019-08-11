require "test/unit"
require_relative "../src/app.rb"

class PuzzleFighterTest < Test::Unit::TestCase
  def setup
    @expected_output_format = /\A([RGBY ]{6}\n){11}[RGBY ]{6}/m
    @instructions = Array.new(13, %w[BR LLL])
  end

  def test_returns_expected_game_output_format
    assert_match @expected_output_format, puzzle_fighter(@instructions)
  end

  def test_passes_initial_state_in_expected_format
    initial_state = []
    stub(MainLoop).call(initial_state, %w[BR LLL]).times(1)
    stub(MainLoop).call(anything, anything).times(12) { initial_state }

    PuzzleFighter.call(@instructions)
  end
end
