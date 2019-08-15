require "test/unit"
require_relative "../src/app.rb"

class RainbowTest < BaseTestCase
  def test_removes_rainbow_from_board
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "R     ", "R     ",
      "BB   Y", "BB    ",
      "BBR  Y", "BBR   ",
      "BBBYBY", "BBB B ",
    ]

    input, expected = _set_from_ascii(templates)

    result =
      input
      .then(["0R", "A"], &MainLoop)
      .then(&Rainbow)

    assert_equal(*_format_all(expected, result))
  end
end
