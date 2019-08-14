require "test/unit"
require_relative "../src/app.rb"

class PowerTest < BaseTestCase
  def test_marks_power_gems
    templates = [
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

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Power.call(input, "B").sort)

    assert_equal ascii_expected, ascii_output
  end

  def test_finds_nothing_if_there_is_no_gems
    templates = [
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

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Power.call(input, "G").sort)

    assert_equal ascii_expected, ascii_output
  end

  def test_finds_only_power_blocks_of_size_4_or_more
    templates = [
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

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Power.call(input, "B").sort)

    assert_equal ascii_expected, ascii_output
  end
end
