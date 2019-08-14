require "test/unit"
require_relative "../src/app.rb"

class HistogramAreaTest < BaseTestCase
  def test_marks_power_gems
    row = [6, 2, 5, 4, 5, 1, 6]

    assert_equal [12, [2, 3, 4]], HistogramArea.call(row)
  end
end
