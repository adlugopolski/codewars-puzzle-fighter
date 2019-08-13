require "test/unit"
require_relative "../src/app.rb"

class InjectTest < BaseTestCase
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
end
