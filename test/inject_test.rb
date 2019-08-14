require "test/unit"
require_relative "../src/app.rb"

class InjectTest < BaseTestCase
  def test_does_not_change_on_empty_input
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     Y", "     Y",
      "     Y", "     Y",
      "RRRYBY", "RRRYBY",
    ]

    input, expected = _set_from_ascii(templates)

    blocks = Inject.call input, []

    assert_equal expected.sort, blocks.sort
  end

  def test_inserts_new_blocks_into_the_board
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     Y", "     Y",
      "     Y", " YB  Y",
      "RRRYBY", "RRRYBY",
    ]

    input, expected = _set_from_ascii(templates)

    new_blocks = [
      Block.new("Y", 1, 0),
      Block.new("B", 2, 0),
    ]

    board = new_blocks.reduce(input) do |state, block|
      Inject.call(state, block)
    end

    ascii_expected, ascii_output = _format_all(expected.sort, board)

    assert_equal ascii_expected, ascii_output
  end

  def test_inserts_new_blocks_into_the_board_with_power_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", " YB   ",
      "RRRR Y", "RRRR Y",
      "RRRR Y", "RRRR Y",
      "   BBY", "   BBY",
    ]

    new_blocks = [
      Block.new("Y", 1, 0),
      Block.new("B", 2, 0),
    ]

    board = new_blocks.reduce(input) do |state, block|
      Inject.call(state, block)
    end

    assert_equal(*_format_all(expected.sort, board))
  end

  def test_inserts_new_power_blocks
    input, expected = _set_from_ascii [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "   GG ",
      "      ", "   GG ",
      "RRRR Y", "RRRR Y",
      "RRRR Y", "RRRR Y",
      "   BBY", "   BBY",
    ]

    blocks = Inject.call(
      input,
      [
        Block.new("G", 3, 0),
        Block.new("G", 4, 0),
        Block.new("G", 3, 1),
        Block.new("G", 4, 1),
      ],
    )

    assert_equal(*_format_all(expected.sort, blocks))
  end
end
