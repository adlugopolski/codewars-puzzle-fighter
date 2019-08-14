require "test/unit"
require_relative "../src/app.rb"

class Object
  def if_none
    if nil?
      yield if block_given?
    else
      self
    end
  end
end

class BoardTest < BaseTestCase
  def test_is_truthy_for_static_power_block
    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      " Y    ", "      ",
      "      ", "      ",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR  ",
      " G B  ", "      ",
      "   BBY", "      ",
      "   BBB", "      ",
    ]

    input, power_block  = _set_from_ascii(templates)

    assert Board.new(input).power_block_static?(power_block)
  end

  def test_is_false_for_hanging_power_block
    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      " Y    ", "      ",
      "      ", "      ",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR  ",
      "G  B  ", "      ",
      " G  BY", "      ",
      "GG BBB", "      ",
    ]

    input, power_block  = _set_from_ascii(templates)

    refute Board.new(input).power_block_static?(power_block)
  end

  def test_is_truthy_for_floor_power_block
    templates = [
      "     Y", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  B   ", "      ",
      " Y    ", "      ",
      "      ", "      ",
      "RRRR  ", "RRRR  ",
      "RRRR Y", "RRRR  ",
      "G  B  ", "      ",
      "RR  BY", "RR    ",
      "RR BBB", "RR    ",
    ]

    input, power_block  = _set_from_ascii(templates)

    assert Board.new(input).power_block_static?(power_block)
  end

  def test_returns_all_power_blocks
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

    assert_equal [4, 6, 8], Board.new(input).power_blocks.map(&:size).sort
  end

  def test_returns_count_of_power_blocks
    board = Board.new [
      Block.new("R1", 1, 2),
      Block.new("R1", 1, 3),
    ]

    assert_equal 1, board.power_count
  end
end
