require "test/unit"
require_relative "../src/app.rb"

class GameTest < Test::Unit::TestCase
  def setup
    @instructions = [
      %w[BR LLL],
      %w[BY LL],
      %w[BG ALL],
      %w[BY BRR],
      %w[RR AR],
      %w[GY A],
      %w[BB AALLL],
      %w[GR A],
      %w[RY LL],
      %w[GG L],
      %w[GY BB],
      %w[bR ALLL],
      %w[gy AAL],
    ]

    @game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "    R ",
      " R  YR",
      "RR  RB"
    ].join("\n")

    @expected_output_format = /\A([RGBY ]{6}\n){11}[RGBY ]{6}/m
  end

  def test_returns_expected_state_in_expected_format
    assert_match @expected_output_format, @game_state
  end

  def test_returns_expected_game_output_format
    assert_match @expected_output_format, puzzle_fighter(@instructions)
  end

  def test_passes_initial_state_in_expected_format
    initial_state = Array.new(12, " " * 6)
    stub(MainLoop).call(initial_state, %w[BR LLL]).times(1)
    stub(MainLoop).call(anything, anything).times(12)

    PuzzleFighter.call(@instructions)
  end

  def xtest_returns_expected_game_state
    pend("Not implemented")

    assert_equal @game_state, puzzle_fighter(@instructions)
  end
end
