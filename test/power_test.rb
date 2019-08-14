require "test/unit"
require_relative "../src/app.rb"

class PowerTest < BaseTestCase
  def test_marks_power_gems
    templates = [
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "      ", "      ",
      "     g", "      ",
      "    RR", "      ",
      "RY  RR", "RY    ",
      "BBRgBY", "BBRgBY",
      "BBRYYY", "BRRRRY",
      "BBBYYB", "BRBYBY",
    ]

    input, expected = _set_from_ascii(templates)

    ascii_expected, ascii_output =
      _format_all(expected.sort, Power.call(input).sort)

    assert_equal ascii_expected, ascii_output
  end
end
