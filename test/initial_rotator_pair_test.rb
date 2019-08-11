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

    # Left movement

    def test_moves_the_pair_to_the_left
      block1 = Block.new("B", 3, 0)
      block2 = Block.new("Y", 3, 1)

      new_block1, new_block2 = Pair.new(block1, block2).move_left

      assert_equal new_block1, Block.new("B", 2, 0)
      assert_equal new_block2, Block.new("Y", 2, 1)
    end

    def test_does_not_move_the_leftmost_pair_to_the_left
      block1 = Block.new("B", 1, 0)
      block2 = Block.new("Y", 0, 0)

      new_block1, new_block2 = Pair.new(block1, block2).move_left

      assert_equal new_block1, Block.new("B", 1, 0)
      assert_equal new_block2, Block.new("Y", 0, 0)
    end

    def test_does_not_mutate_on_left_move
      block1 = Block.new("B", 3, 0)
      block2 = Block.new("Y", 2, 0)

      Pair.new(block1, block2).move_left

      assert_equal block1, Block.new("B", 3, 0)
      assert_equal block2, Block.new("Y", 2, 0)
    end

    # Right movement

    def test_moves_the_pair_to_the_right
      block1 = Block.new("B", 3, 0)
      block2 = Block.new("Y", 3, 1)

      new_block1, new_block2 = Pair.new(block1, block2).move_right

      assert_equal new_block1, Block.new("B", 4, 0)
      assert_equal new_block2, Block.new("Y", 4, 1)
    end

    def test_does_not_move_the_rightmost_pair_to_the_right
      block1 = Block.new("B", 4, 0)
      block2 = Block.new("Y", 5, 0)

      new_block1, new_block2 = Pair.new(block1, block2).move_right

      assert_equal new_block1, Block.new("B", 4, 0)
      assert_equal new_block2, Block.new("Y", 5, 0)
    end

    def test_does_not_mutate_on_right_move
      block1 = Block.new("B", 3, 0)
      block2 = Block.new("Y", 2, 0)

      Pair.new(block1, block2).move_right

      assert_equal block1, Block.new("B", 3, 0)
      assert_equal block2, Block.new("Y", 2, 0)
    end
  end
end
