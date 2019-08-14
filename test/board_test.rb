require "test/unit"
require_relative "../src/app.rb"

class BoardTest < BaseTestCase
  def test_is_hanging_over_board
    pend
  end

  def test_returns_all_hanging_blocks
    pend
  end

  def test_is_memer_of_power_block
    pend

    template = [
      "     Y",
      "      ",
      "      ",
      "      ",
      "  B   ",
      " Y    ",
      "      ",
      "RRRR  ",
      "RRRR Y",
      " G B  ",
      "   BBY",
      "   RBR",
    ]

    board = Board.new(_from_ascii(template))

    assert board.locked_power_block?(board.at(0, 8))
    assert board.locked_power_block?(board.at(0, 7))
    assert board.locked_power_block?(board.at(3, 8))
    refute board.locked_power_block?(board.at(4, 0))
  end
end
