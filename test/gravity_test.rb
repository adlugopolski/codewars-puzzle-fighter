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

  def test_does_move_down_trapped_blocks
    pend

    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      " Y    ", "      ",
      "      ", " YB   ",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR Y",
      " G B  ", "   B Y",
      "   BBY", "   BBY",
      "   BBB", " G BBB",
    ]

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Gravity.call(input).sort)

    assert_equal ascii_expected, ascii_output
  end
end
