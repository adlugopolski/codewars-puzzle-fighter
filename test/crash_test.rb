require "test/unit"
require_relative "../src/app.rb"

class CrashTest < BaseTestCase
  def test_removes_crash_gems_from_board
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "R     ", "R     ",
      "Bb   Y", "     Y",
      "BBR  Y", "  R  Y",
      "BBBYBY", "   YBY",
    ]

    input, expected = _set_from_ascii(templates)

    assert_equal expected, Crash.call(Block.new("b", 1, 9), input)
  end

  def test_removes_crash_gems_from_board_2
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "RY    ", "RY    ",
      "BBRrBY", "BB  BY",
      "BRRRRY", "B    Y",
      "BRBYBY", "B BYBY",
    ]

    input, expected = _set_from_ascii(templates)

    assert_equal expected, Crash.call(Block.new("r", 3, 9), input)
  end

  def test_does_not_crash_lonely_blocks
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "RY    ", "RY    ",
      "BBRgBY", "BBRgBY",
      "BRRRRY", "BRRRRY",
      "BRBYBY", "BRBYBY",
    ]

    input, expected = _set_from_ascii(templates)

    assert_equal expected, Crash.call(Block.new("g", 3, 9), input)
  end
end
