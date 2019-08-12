require "test/unit"
require_relative "../src/app.rb"

class BaseTestCase < Test::Unit::TestCase
  def _format(blocks, rows = 12)
    FormatOutput.call(blocks, rows)
  end

  def _set_from_ascii(templates)
    convert_board = proc do |board|
      board.flat_map.with_index(0) do |row, y|
        row.chars.flat_map.with_index(0) do |kind, x|
          next [] if kind == " "

          Block.new(kind, x, y)
        end
      end
    end

    templates
      .partition
      .with_index(1) { |_, i| i.odd? }
      .map(&convert_board)
  end
end
