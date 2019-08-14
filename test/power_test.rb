require "test/unit"
require_relative "../src/app.rb"

class PowerTest < BaseTestCase
  def test_marks_first_power_block
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     g", "      ",
      "    RR", "      ",
      "RY  RR", "      ",
      "BBBgBY", "BBB   ",
      "BBBYBB", "BBB   ",
      "BBBYBB", "BBB   ",
    ]

    assert_equal(*_format_all(expected.sort, Power.call(input, "B").sort))
  end

  def test_prefers_horizontal_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     g", "      ",
      "    RR", "      ",
      "RY  RR", "      ",
      "BBRgBY", "      ",
      "BBBYBB", "BBB   ",
      "BBBYBB", "BBB   ",
    ]

    assert_equal(*_format_all(expected.sort, Power.call(input, "B").sort))
  end

  def test_finds_nothing_if_there_is_no_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     g", "      ",
      "    RR", "      ",
      "RY  RR", "      ",
      "BBRgBY", "      ",
      "BYBYYB", "      ",
      "BBBYBB", "      ",
    ]

    assert_equal(*_format_all(expected.sort, Power.call(input, "G").sort))
  end

  def test_finds_only_power_blocks_of_size_4_or_more
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     g", "      ",
      "    RR", "      ",
      "RY  RR", "      ",
      "BBRgBB", "      ",
      "BrBYBr", "      ",
      "BBBYBB", "      ",
    ]

    assert_equal(*_format_all(expected.sort, Power.call(input, "B").sort))
  end

  def test_does_not_detect_single_column_vertical_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      "  B   ", "      ",
      "  B   ", "      ",
      "YYB   ", "      ",
      "YBBRR ", " BB   ",
      "YBBBG ", " BB   ",
      "GGBGG ", "      ",
    ]

    assert_equal(*_format_all(expected.sort, Power.call(input, "B").sort))
  end

  def test_does_not_detect_single_column_horizontal_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "YYB   ", "      ",
      "YBBRR ", " BB   ",
      "BBBBB ", " BB   ",
      "GGBGG ", "      ",
    ]

    assert_equal(*_format_all(expected.sort, Power.call(input, "B").sort))
  end
end
