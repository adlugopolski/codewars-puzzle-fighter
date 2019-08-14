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

    blocks = Inject.call(
      input,
      [
        Block.new("Y", 1, 0),
        Block.new("B", 2, 0),
      ],
    )

    assert_equal expected.sort, blocks.sort
  end

  def test_inserts_new_blocks_into_the_board_with_power_blocks
    templates = [
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

    input, expected = _set_from_ascii(templates)

    blocks = Inject.call(
      input,
      [
        Block.new("Y", 1, 0),
        Block.new("B", 2, 0),
      ],
    )

    assert_equal expected.sort, blocks.sort
  end

  def test_inserts_new_power_blocks
    templates = [
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

    input, expected = _set_from_ascii(templates)

    blocks = Inject.call(
      input,
      [
        Block.new("G", 3, 0),
        Block.new("G", 4, 0),
        Block.new("G", 3, 1),
        Block.new("G", 4, 1),
      ],
    )

    ascii_expected, ascii_output = _format_all(expected.sort, blocks)

    assert_equal ascii_expected, ascii_output
  end
end
