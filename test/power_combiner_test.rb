require "test/unit"
require_relative "../src/app.rb"

class PowerCombinerTest < BaseTestCase
  def test_doesnt_change_the_board_while_marking_power_blocks
    input = _from_ascii [
      "     Y",
      "      ",
      "      ",
      "      ",
      "  B   ",
      " Y GGG",
      "   GGG",
      "RRRR  ",
      "RRRR Y",
      "G  B  ",
      "RR  BY",
      "RR BBB",
    ]

    assert_equal(*_format_all(input.sort, PowerCombiner.call(input).sort))

  end

  def test_marks_power_gem_on_the_board
    input, expected = _set_from_ascii [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      " Y GGG", "   GGG",
      "   GGG", "   GGG",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR  ",
      "G  B  ", "      ",
      "RR  BY", "RR    ",
      "RR BBB", "RR    ",
    ]

    result = Board.new(PowerCombiner.call(input)).select(&:power_positive?)

    assert_equal(*_format_all(expected, result))
  end
end
