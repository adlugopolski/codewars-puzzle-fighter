require "test/unit"
require_relative "../src/app.rb"

class GravityTest < BaseTestCase
  def test_moves_basic_games_down
    templates = [
      "     G", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "YYY   ", "      ",
      "      ", "      ",
      "      ", "      ",
      "R     ", "     G",
      "     Y", "     Y",
      "  R  Y", "Y Y  Y",
      "   YBY", "RYRYBY",
    ]

    input, expected = _set_from_ascii(templates)

    assert_equal expected.sort, Gravity.call(input).sort
  end

  def test_does_not_move_power_blocks_down
    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      " Y    ", "      ",
      "      ", "      ",
      "RRRR  ", " YB   ",
      "RRRR Y", "RRRR Y",
      "      ", "RRRR Y",
      "   BBY", "   BBY",
    ]

    input, expected = _set_from_ascii(templates)

    pend {
      assert_equal expected.sort, Gravity.call(input).sort
    }
  end
end
