require "test/unit"
require_relative "../src/app.rb"

class MainLoopTest < BaseTestCase
  def test_returns_the_expected_board_layout_with_markers
    assert_equal(
      _format(MainLoop.call([], %w[BR LLL])),
      [*Array.new(10, " " * 6), "B     ", "R     "]
    )
  end
end
