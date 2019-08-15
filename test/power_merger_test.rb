require "test/unit"
require_relative "../src/app.rb"

class PowerMergerTest < BaseTestCase

  def test_merges_new_blocks_into_power_block
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
      "      ", "RR    ",
      "RR    ", "RRR   ",
      "RR    ", "RRR   ",
    ]

    result =
      input
      .then(&PowerCombiner)
      .then(&Board)
      .then { |block| MainLoop.call block, ["RR", "ALLL"] }
      .then { |block| MainLoop.call block, ["RR", "L"] }
      .then(&PowerCombiner)
      .select(&:power_positive?)

    assert_equal(*_format_all(expected, result))
  end
end
