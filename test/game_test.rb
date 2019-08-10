require "test/unit"
require_relative "../src/app.rb"

class GameTest < Test::Unit::TestCase
  def x_test_solves_game_0
    instructions = [
      %w[BR LLL],
      %w[BY LL],
      %w[BG ALL],
      %w[BY BRR],
      %w[RR AR],
      %w[GY A],
      %w[BB AALLL],
      %w[GR A],
      %w[RY LL],
      %w[GG L],
      %w[GY BB],
      %w[bR ALLL],
      %w[gy AAL],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "    R ",
      " R  YR",
      "RR  RB"
    ].join("\n")

    pend

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def x_test_solve_game_2
    instructions = [
      ["GR", "ALLL"],
      ["GG", "ALLL"],
      ["RG", "AAL"],
      ["RB", "BLL"],
      ["RG", "ALL"],
      ["BB", "RR"],
      ["BR", "BB"],
      ["BR", "ALLL"],
      ["YB", "R"],
      ["BG", "BBRR"],
      ["YR", "AAR"],
      ["RR", "L"],
      ["RR", "ABLL"],
      ["GY", "BRR"],
      ["BB", "R"],
      ["gB", "RR"],
      ["BR", "ALL"],
      ["Gr", "BB"],
      ["Rb", "R"],
      ["GG", "B"],
      ["bB", "LL"],
    ]

    pend

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "    R ",
      "  GGY ",
      "  GGYB",
      "GGGRYB",
      "GRRBBB",
    ].join("\n")

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def x_test_solve_game_3
    instructions = [
      ["RR","LLL"],
      ["GG","LL"],
      ["RG","BBL"],
      ["GY","AR"],
      ["RR","BBLLL"],
      ["RB","AALL"],
      ["GR","B"],
      ["GB","AR"],
      ["RR",""],
      ["GG","R"],
      ["YR","BR"],
      ["RR","LLL"],
      ["BR","AALL"],
      ["Bg",""],
      ["RR","BBBBLLL"],
      ["GR","ALLL"],
      ["bR","L"],
      ["YG","BBBALL"],
      ["RR","L"],
      ["YB","AL"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "GG    ",
      "RY    ",
      "RRYB  ",
      "RRRB  ",
      "R RgY ",
      "R RRG ",
      "RRRRG ",
      "RGGRGB",
      "RGRGGY",
    ].join("\n")

    pend

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def x_test_solve_game_4
    instructions = [
      ["BB", "LLLL"],
      ["BB", "LL"],
      ["BB", "L"],
      ["BB", "LLL"],
      ["BB", "LL"],
      ["BG", "L"],
      ["BB", ""],
      ["BB", "R"],
      ["RB", "BBRRR"],
      ["RR", "LLL"],
      ["RR", "BALL"],
      ["RR", ""],
      ["RR", "R"],
      ["RR", "L"],
      ["RR", "B"],
      ["RR", "LLL"],
      ["RR", "LL"],
      ["RR", "BLLL"],
      ["RR", "B"],
      ["YR", "ALL"],
      ["GR", "AL"],
      ["Rb", "RRRR"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      " YG   ",
      "RRR   ",
      "RRR   ",
      "RRRR  ",
      "RRRR  ",
      "RRRR  ",
      "   RRR",
      "  GRRR",
    ].join("\n")

    pend

    assert_equal game_state, puzzle_fighter(instructions)
  end
end
