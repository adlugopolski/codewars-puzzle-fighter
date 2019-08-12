require "test/unit"
require_relative "../src/app.rb"

class CrashTest < Test::Unit::TestCase
  def _set_from_ascii(templates)
    convert_board = proc do |board|
      board.flat_map.with_index(0) do |row, y|
        row.chars.flat_map.with_index(0) do |kind, x|
          next [] if kind == " "

          Block.new(kind, x, y)
        end
      end
    end

    templates
      .partition
      .with_index(1) { |_, i| i.odd? }
      .map(&convert_board)
  end

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

    assert_equal expected, Crash.call(input, Block.new("b", 1, 9))
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

    assert_equal expected, Crash.call(input, Block.new("r", 3, 9))
  end
end
