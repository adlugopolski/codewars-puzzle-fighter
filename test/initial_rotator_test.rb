require "test/unit"
require_relative "../src/app.rb"

class InitialRotatorTest < Test::Unit::TestCase
  def test_moves_the_piece_to_initial_location
    pend

    assert_match(
      InitialRotator.call(["BR", "LLL"]),
      ["B     ", "R      "],
    )
  end
end
