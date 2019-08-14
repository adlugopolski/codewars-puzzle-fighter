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

    ascii_expected, ascii_output =
      _format_all(expected.sort, Gravity.call(input).sort)

    assert_equal ascii_expected, ascii_output
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
      "      ", " YB   ",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR Y",
      "   R  ", "   R Y",
      "   BBY", "   BBY",
    ]

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Gravity.call(input).sort)

    assert_equal ascii_expected, ascii_output
  end

  def test_does_move_down_trapped_blocks
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

  def test_does_not_move_multiple_power_blocks
    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "     Y",
      " Y GGG", "   GGG",
      "   GGG", " YBGGG",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR  ",
      " G B  ", "   B Y",
      "   BBY", "   BBY",
      "   BBB", " G BBB",
    ]

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Gravity.call(input).sort)

    assert_equal ascii_expected, ascii_output
  end

  def test_does_move_hanging_power_blocks
    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  BGGG", "     Y",
      " Y GGG", "   GGG",
      "      ", " YBGGG",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR  ",
      " G B  ", "   B Y",
      "   BBY", "   BBY",
      "   BBB", " G BBB",
    ]

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Gravity.call(input).sort)

    assert_equal ascii_expected, ascii_output
  end

  def test_does_move_trapped_power_block
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      " BBBB ", " BBBB ",
      "RBBBB ", " BBBB ",
      " RR G ", "    G ",
      " RRBG ", " RR G ",
      "    G ", "RRRBG ",
    ]

    assert_equal(*_format_all(expected.sort, Gravity.call(input).sort))
  end

  def test_does_move_combined_power_gems
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      " YG   ", "      ",
      "BBB   ", "      ",
      "BBB   ", " YG   ",
      "RRRR  ", "BBB   ",
      "RRRR  ", "BBB   ",
      "RRRR  ", "RRRR  ",
      "   RRR", "RRRR  ",
      "  GRR ", "RRRR  ",
      "      ", "   RRR",
      "     R", "  GRRR",
    ]

    assert_equal(*_format_all(expected.sort, Gravity.call(input).sort))
  end
end
