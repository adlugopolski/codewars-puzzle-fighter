require "test/unit"
require_relative "../src/app.rb"

class InitialRotatorTest < Test::Unit::TestCase
  def test_raises_error_on_invalid_move
    assert_raise ArgumentError do
      InitialRotator.call(["BR", "LLLX"])
    end
  end

  def test_moves_the_piece_to_initial_location_1
    pend

    assert_match(
      InitialRotator.call(["BR", "LLL"]),
      ["B     ", "R     "],
    )
  end

  def test_moves_the_piece_to_initial_location_2
    pend

    assert_match(
      InitialRotator.call(["BG", "ALL"]),
      ["      ", " BG   "],
    )
  end

  def test_moves_the_piece_to_initial_location_3
    pend

    assert_match(
      InitialRotator.call(["BY", "BRR"]),
      ["      ", "    YB"],
    )
  end

  def test_moves_the_piece_to_initial_location_4
    pend

    assert_match(
      InitialRotator.call(["BB", "AALLL"]),
      ["B     ", "B     "],
    )
  end

  def test_moves_the_piece_to_initial_location_5
    assert_match(
      InitialRotator.call(["YR", ""]),
      ["   Y  ", "   R  "],
    )
  end

  def test_moves_the_piece_to_initial_location_6
    pend

    assert_match(
      InitialRotator.call(["BG", "BBRR"]),
      ["     G", "     B"],
    )
  end

  def test_moves_the_piece_to_initial_location_7
    pend

    assert_match(
      InitialRotator.call(["RR", "BBBBLLL"]),
      ["R     ", "R     "],
    )
  end

  def test_moves_the_piece_to_initial_location_8
    pend

    assert_match(
      InitialRotator.call(["YG", "BBBALL"]),
      [" G    ", " Y    "],
    )
  end
end
