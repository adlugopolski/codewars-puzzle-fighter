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
      "BBR  Y", "BBR R ",
      "BBBYBY", "BBB B ",
    ]

    input, expected = _set_from_ascii(templates)

    result =
      input
      .then(["0R", "A"], &MainLoop)
      .then(&Rainbow)

    assert_equal(*_format_all(expected, result))
  end

  def test_lost_rainbow_does_nothing
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
      "BB   Y", "BB   Y",
      "BBR  Y", "BBRR Y",
      "BBBY Y", "BBBY Y",
    ]

    input, expected = _set_from_ascii(templates)

    result =
      input
      .then(["0R", "BR"], &MainLoop)
      .then(&Rainbow)

    assert_equal(*_format_all(expected, result))
  end
end
