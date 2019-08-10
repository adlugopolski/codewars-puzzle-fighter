require "test/unit"
require_relative "../src/app.rb"

class MainLoopTest < Test::Unit::TestCase
  def setup
    @initial_state = Array.new(12, " " * 6)
  end

  def test_returns_the_expected_board_layout_with_markers
    assert_match(
      MainLoop.call(@initial_state, %w[BR LLL]),
      [*Array.new(10, " " * 6), "B     ", "R     "]
    )
  end
end
