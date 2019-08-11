require "test/unit"
require_relative "../src/app.rb"

class BoardTest < Test::Unit::TestCase
  def test_inserts_new_blocks_into_the_board
    blocks = Board.call(
      [Block.new("A", 1, 11), Block.new("A", 1, 10)],
      [Block.new("Y", 1, 0), Block.new("B", 2, 0)],
    )

    assert_equal(
      blocks,
      [
        Block.new("A", 1, 11),
        Block.new("A", 1, 10),
        Block.new("B", 2, 11),
        Block.new("Y", 1, 9),
      ]
    )
  end
end
