module Colors
  refine String do
    def black
      "\e[30m#{self}\e[0m"
    end

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

    def red
      "\e[31m#{self}\e[0m"
    end
  end
end

class DebugState
  using Colors

  COLOR_MAP = {
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

  def self.call(*args)
    new(*args).call
  end

  def initialize(state)
    @state = state
  end

  def call
    @state.map do |row|
      output_row = row.chars.map do |char|
        COLOR_MAP.fetch(char, char)
      end
      format("|%s|", output_row.join)
    end
  end
end

class DebugRun
  def self.call(*args)
    new(*args).call
  end

  def initialize(puzzle_figther, max_entries = nil)
    @puzzle_figther = puzzle_figther
    @max_entries = Integer(max_entries || puzzle_figther.input.size)
  end

  def call
    [header, body].join("\n")
  end

  private

  def output
    @puzzle_figther
      .debug
      .last(@max_entries)
      .map(&FormatOutput.method(:call))
      .transpose
      .map { |line| DebugState.call(line).join(" ") }
  end

  def header
    @puzzle_figther
      .input
      .last(@max_entries)
      .map { |command| format "%-8s", command.join(" ") }
      .join(" ")
  end

  def bar
    @_bar ||= Array.new(@max_entries) { "+------+" }
  end

  def body
    [
      bar.join(" "),
      output,
      bar.join(" "),
    ]
  end
end
