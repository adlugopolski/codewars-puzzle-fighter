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
      "Bb   Y", "Bb   Y",
      "BBR  Y", "BBR  Y",
      "BBBYBY", "BBBYBY",
    ]

    input, expected = _set_from_ascii(templates)

    result =
      input
      .then(["0R", "A"], &MainLoop)
      .then(&Rainbow)

    assert_equal expected, result
  end
end
