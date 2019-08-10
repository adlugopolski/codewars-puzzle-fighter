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
  end

  def test_main_game_output_format
    assert_match(
      /\A([RGBY ]{6}\n){11}[RGBY ]{6}/m,
      puzzle_fighter(@instructions),
    )
  end

  def test_main_game_loop
    pend("Not implemented")

    assert_equal @game_state, puzzle_fighter(@instructions)
  end
end
