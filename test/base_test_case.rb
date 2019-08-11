require "test/unit"
require_relative "../src/app.rb"

class BaseTestCase < Test::Unit::TestCase
  def _format(blocks, rows = 12)
    FormatOutput.call(blocks, rows)
  end
end
