require "test/unit"
require_relative "../src/app.rb"

class PowerMergerTest < BaseTestCase
  using ObjectExtensions

  def test_merges_two_power_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "RR    ", "RRRR  ",
      "RR    ", "RRRR  ",
    ]

    result =
      input
      .follow(&PowerCombiner)
      .then(&Board)
      .follow(["RR", ""], &MainLoop)
      .follow(["RR", "L"], &MainLoop)
      .then(&PowerCombiner)
      .then(&:power_blocks)
      .then(&:first)

    assert_equal(*_format_all(expected, result))
  end
end
