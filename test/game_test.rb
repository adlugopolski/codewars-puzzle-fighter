require "test/unit"
require_relative "../src/app.rb"

class GameTest < Test::Unit::TestCase
  def test_solves_game_without_specials
    instructions = [
      ["BR", "LLL"],
      ["BY", "LL"],
      ["BG", "ALL"],
      ["BY", "BRR"],
      ["RR", "AR"],
      ["GY", "A"],
      ["BB", "AALLL"],
      ["GR", "A"],
      ["RY", "LL"],
      ["GG", "L"],
      ["GY", "BB"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      " R    ",
      "BY YR ",
      "BBGGY ",
      "BBGGRR",
      "RYGGYB",
    ].join("\n")

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_1
    instructions = [
      ["BR", "LLL"],
      ["BY", "LL"],
      ["BG", "ALL"],
      ["BY", "BRR"],
      ["RR", "AR"],
      ["GY", "A"],
      ["BB", "AALLL"],
      ["GR", "A"],
      ["RY", "LL"],
      ["GG", "L"],
      ["GY", "BB"],
      ["bR", "ALLL"],
      ["gy", "AAL"],
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

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_2
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

  def x_test_solves_game_3
    instructions = [
      ["RR", "LLL"],
      ["GG", "LL"],
      ["RG", "BBL"],
      ["GY", "AR"],
      ["RR", "BBLLL"],
      ["RB", "AALL"],
      ["GR", "B"],
      ["GB", "AR"],
      ["RR", ""],
      ["GG", "R"],
      ["YR", "BR"],
      ["RR", "LLL"],
      ["BR", "AALL"],
      ["Bg", ""],
      ["RR", "BBBBLLL"],
      ["GR", "ALLL"],
      ["bR", "L"],
      ["YG", "BBBALL"],
      ["RR", "L"],
      ["YB", "AL"],
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

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_4
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

    assert_equal game_state, puzzle_fighter(instructions)
  end
end
