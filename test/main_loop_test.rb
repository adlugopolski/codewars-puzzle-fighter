require "test/unit"
require_relative "../src/app.rb"

class MainLoopTest < BaseTestCase
  def test_returns_the_expected_board_layout_with_markers
    assert_equal(
      _format(MainLoop.call([], %w[BR LLL])),
      [*Array.new(10, " " * 6), "B     ", "R     "]
    )
  end

  def test_returns_the_expected_board_layout_with_markers_2
    state = MainLoop.call([], ["BR", "LLL"])
    state = MainLoop.call(state, ["YB", "LL"])

    assert_equal(
      _format(state),
      [*Array.new(10, " " * 6), "BY    ", "RB    "]
    )
  end
end
