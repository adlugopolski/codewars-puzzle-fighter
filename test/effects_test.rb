require "test/unit"
require_relative "../src/app.rb"

class EffectTest < Test::Unit::TestCase
  def test_does_not_modify_basic_board
    blocks = [
      Block.new("A", 1, 11),
      Block.new("A", 1, 10),
      Block.new("B", 2, 11),
      Block.new("Y", 1, 9),
    ]

    new_blocks = Effects.call(blocks)

    assert_equal blocks, new_blocks
  end
end
