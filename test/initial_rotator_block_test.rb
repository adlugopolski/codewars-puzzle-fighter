require "test/unit"
require_relative "../src/app.rb"

class InitialRotator::BlockTest < Test::Unit::TestCase
  def test_is_truthy_for_equal_objects
    assert_equal(
      InitialRotator::Block.new("B", 3, 2),
      InitialRotator::Block.new("B", 3, 2),
    )
  end

  def test_is_falsey_for_different_kind
    refute_equal(
      InitialRotator::Block.new("B", 3, 2),
      InitialRotator::Block.new("C", 3, 2),
    )
  end

  def test_is_falsey_for_different_x
    refute_equal(
      InitialRotator::Block.new("B", 3, 2),
      InitialRotator::Block.new("B", 2, 2),
    )
  end

  def test_is_falsey_for_different_y
    refute_equal(
      InitialRotator::Block.new("B", 3, 2),
      InitialRotator::Block.new("B", 3, 1),
    )
  end

  def test_returns_leftmost_object_for_equal
    block1 = InitialRotator::Block.new("B", 3, 2)
    block2 = InitialRotator::Block.new("B", 3, 2)

    assert_equal block1, block1 << block2
  end

  def test_returns_leftmost_object_for_different
    block1 = InitialRotator::Block.new("B", 3, 2)
    block2 = InitialRotator::Block.new("B", 2, 2)

    assert_equal block2, block1 << block2
  end

  def test_draws_on_provided_template
    block = InitialRotator::Block.new("B", 3, 1)

    assert_equal(
      ["AAB   ", "C  B  "],
      block.draw_on(["AAB   ", "C     "])
    )
  end

  def test_draws_on_non_mutated_template
    block = InitialRotator::Block.new("B", 3, 1)
    template = ["AAB   ", "C     "]

    block.draw_on(template)

    assert_equal ["AAB   ", "C     "], template
  end
end
