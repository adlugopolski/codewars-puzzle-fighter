require "test/unit"
require_relative "../src/app.rb"

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

  def test_is_hanging_over_board
    pend
  end

  def test_returns_all_hanging_blocks
    pend
  end
end
