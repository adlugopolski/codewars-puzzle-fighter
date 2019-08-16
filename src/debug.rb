module Colors
  refine String do
    def bg_red
      "\e[41m#{self}\e[0m"
    end

    def bg_green
      "\e[42m#{self}\e[0m"
    end

    def bg_brown
      "\e[43m#{self}\e[0m"
    end

    def bg_blue
      "\e[44m#{self}\e[0m"
    end

    def black
      "\e[30m#{self}\e[0m"
    end

    def red
      "\e[31m#{self}\e[0m"
    end

    def green
      "\e[32m#{self}\e[0m"
    end

    def brown
      "\e[33m#{self}\e[0m"
    end

    def blue
      "\e[34m#{self}\e[0m"
    end

    def magenta
      "\e[35m#{self}\e[0m"
    end

    def cyan
      "\e[36m#{self}\e[0m"
    end

    def gray
      "\e[37m#{self}\e[0m"
    end
  end

end

class DebugRun < BaseScaffold
  using ArrayExtensions

  def self.call(*args)
    new(*args).call
  end

  def initialize(puzzle_figther, max_entries = nil)
    @puzzle_figther = puzzle_figther
    @max_entries = Integer(max_entries || puzzle_figther.input.size)
  end

  def call
    [blocks, output].unlines
  end

  private

  def output
    @puzzle_figther
      .debug
      .last(@max_entries)
      .map(&PowerDebug)
      .transpose
      .map(&:unpipes)

  end

  def blocks
    @puzzle_figther
      .input
      .last(@max_entries)
      .map(&method(:headers))
      .transpose
      .map(&:unwords)
      .unlines
  end

  def headers(commands)
    commands.map do |command|
      format("%-6s", command)[0..5]
    end
  end
end

class PowerDebug < BaseScaffold
  using ArrayExtensions
  using Colors

  MAP = {
    "R" => "R".bg_red.black,
    "G" => "G".bg_green.black,
    "B" => "B".bg_blue.black,
    "Y" => "Y".bg_brown.black,
    "r" => "r".bg_red.black,
    "g" => "g".bg_green.black,
    "b" => "b".bg_blue.black,
    "y" => "y".bg_brown.black,
    "0" => "0".red,
    " " => ".",
  }.freeze

  def initialize(board, comment = nil)
    @board = Board.new(board)
    @comment = comment
  end

  def call
    [@comment, *table, "------"].compact
  end

  def table
    (0..11).map do |row|
      (0..5).map do |col|
        @board
          .at(col, row)
          .if_none { Block.new(".", row, col, 0) }
          .then(&method(:colorize))
      end.join("")
    end
  end

  def colorize(block)
    output = MAP.fetch(block.kind, block.kind)
    if block.power_positive?
      output.tr(block.kind, block.power.to_s[-1])
    else
      output
    end
  end
end

def TS(comment = nil)
  $start ||= Time.now
  puts format("%.4f %s", Time.now - $start, comment)
end

def CN(name, value = 1)
  $count ||= Hash.new(0)
  $count[name] += value
end

def BM(name)
  CN name + "/count"
  from = Time.now
  value = yield
  CN name + "/time", Time.now - from
  value
end
