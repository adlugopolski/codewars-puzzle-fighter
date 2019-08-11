require "test/unit"
require_relative "../src/app.rb"

class InitialRotator
  class PairTest < Test::Unit::TestCase
    def test_returns_string_representation
      block1 = Block.new("B", 3, 0)
      block2 = Block.new("Y", 3, 1)

      assert_equal(
        ["   B  ", "   Y  "],
        Pair.new(block1, block2).to_s,
      )
    end
  end
end
