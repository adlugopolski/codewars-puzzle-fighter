require "test/unit"
require_relative "../src/app.rb"

class PowerExpanderTest < BaseTestCase
  def test_expands_the_power_block
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "  R   ", "RR    ",
      "RRB   ", "RR    ",
      "RRB   ", "RR    ",
      "YYYYYY", "      ",
    ]

    result =
      input
      .then(&PowerCombiner)
      .then(&Board)
      .then(["RR", "BLL"], &MainLoop)
      .then(&PowerCombiner)
      .then(&PowerMerger)
      .then(&PowerExpander)
      .then(&:power_blocks)
      .then(&:first)

    assert_equal(*_format_all(expected, result))
  end

  def test_expands_properly
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "R     ", "      ",
      "R R   ", "RRR   ",
      "RRR   ", "RRR   ",
      "RRR   ", "RRR   ",
      "RRR   ", "RRR   ",
    ]

    result =
      input
      .then(&PowerCombiner)
      .then(&Board)
      .then(["RR", "ALL"], &MainLoop)
      .then(&PowerExpander)
      .then(&:power_blocks)
      .then(&:first)

    assert_equal(*_format_all(expected, result))
  end
end
