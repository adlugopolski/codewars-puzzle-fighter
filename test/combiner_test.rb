require "test/unit"
require_relative "../src/app.rb"

class CombinerTest < BaseTestCase
  def test_doesnt_change_the_board_on_change
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

    assert_equal input.sort, Combiner.call(input).sort
  end

  def test_marks_power_gem_on_the_board
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

    pass1 = Board.new(Combiner.call(input).sort)
    pass2 = Board.new(Combiner.call(pass1).sort)

    pp pass2

    assert_equal input.sort, pass2
  end
end
