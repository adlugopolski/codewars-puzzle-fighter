require "test/unit"
require_relative "../src/app.rb"

class GameTest < Test::Unit::TestCase
  using ArrayExtensions

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
    ].unlines

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
    ].unlines

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
    ].unlines

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
    ].unlines

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
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_5
    instructions = [
      ["YY", "BALLL"],
      ["RR", "AALL"],
      ["RG", "BR"],
      ["YG", "ALLR"],
      ["BG", "BRR"],
      ["YR", "BBLLLL"],
      ["GR", "BL"],
      ["GG", "ALB"],
      ["GY", ""],
      ["yB", "RR"],
      ["GG", "R"],
      ["RB", "LLLAAAB"],
      ["Ry", "LL"],
      ["BG", "BR"],
      ["RB", "BBRRR"],
      ["Rg", "R"],
      ["bR", "L"],
      ["YR", "BLLL"],
      ["RR", "LLLLLLLL"],
      ["Yg", "AALL"],
      ["Br", "LLL"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "     B",
      "    RR",
      "  b gy",
      "  R BB",
      "BBYYRB",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_6
    instructions = [
      ["RY", "ALLL"],
      ["YY", "L"],
      ["RG", "BBR"],
      ["YR", "BLL"],
      ["RR", "ALLLL"],
      ["GY", "B"],
      ["RR", "RRRRRRR"],
      ["RY", "ALLL"],
      ["BY", "BBBBLL"],
      ["BY", "L"],
      ["BG", "BBBL"],
      ["BB", "LLL"],
      ["BY", "BBLL"],
      ["BR", "AL"],
      ["RB", "AR"],
      ["BB", "RR"],
      ["GG", "R"],
      ["YB", "LLLRR"],
      ["GG", ""],
      ["rb", "RR"],
      ["bY", "ABLL"],
      ["GY", "L"],
      ["GR", "BRR"],
      ["RR", "LLL"],
      ["yy", "LLLB"],
      ["RY", "BB"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "R  Y  ",
      "R  RR ",
      "R  GG ",
      "R  GG ",
      "R  G  ",
      "RRGGGG",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_7
    instructions = [
      ["YR", "LLL"],
      ["GY", "LLLRL"],
      ["RY", "BBLL"],
      ["RB", "AAL"],
      ["GR", "BR"],
      ["GG", "A"],
      ["YY", "LL"],
      ["GG", "BLLL"],
      ["YY", "ALLL"],
      ["BY", "BL"],
      ["YB", "ALLLR"],
      ["RY", "LLLB"],
      ["GG", "BBBBB"],
      ["GB", "A"],
      ["GR", "AA"],
      ["gB", "AALAB"],
      ["YR", "RRAAA"],
      ["BB", ""],
      ["RG", "AL"],
      ["GG", "L"],
      ["RG", "RRBL"],
      ["Gb", "A"],
      ["rB", "R"],
      ["GG", "RR"],
      ["RB", "AARR"],
      ["GG", "BR"],
      ["bR", "AARR"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      " R    ",
      " Y    ",
      "YY    ",
      "YY G  ",
      " YGGG ",
      "YYGGYG",
      "YY GBG",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_8
    instructions = [
      ["BB", "AALLL"],
      ["GR", "RR"],
      ["RR", "R"],
      ["RG", "A"],
      ["YY", "BBBL"],
      ["BG", "RR"],
      ["BY", ""],
      ["Rg", "RR"],
      ["YB", "A"],
      ["BY", "RRAA"],
      ["BY", "L"],
      ["yB", "LLLBB"],
      ["YR", "A"],
      ["Yy", "BBB"],
      ["rY", "BR"],
      ["Rb", "BRR"],
      ["gR", "ARR"],
      ["BB", "B"],
      ["BG", "B"],
      ["RG", "BBLL"],
      ["YG", "LLLA"],
      ["GG", "L"],
      ["RY", "BRR"],
      ["bB", ""],
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
      "  G   ",
      " GG Y ",
      " GG R ",
      "YR RRR",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_9
    instructions = [
      ["YY", "LLL"],
      ["YY", "LLL"],
      ["YY", "LLL"],
      ["YY", "LLL"],
      ["YY", "LLL"],
      ["YY", "LLL"],
      ["YY", ""],
      ["YY", ""],
      ["YY", ""],
      ["YY", ""],
      ["YY", ""],
      ["0Y", ""],
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
      "      ",
      "      ",
      "      ",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_10
    instructions = [
      ["GY", "LL"],
      ["BG", "R"],
      ["BB", "BR"],
      ["GG", "BR"],
      ["RG", "AAL"],
      ["GB", "BBRR"],
      ["YG", "RR"],
      ["YG", "BRR"],
      ["BG", "LL"],
      ["GB", ""],
      ["RR", "R"],
      ["YR", "AAAA"],
      ["RB", "RRA"],
      ["YB", "BB"],
      ["BY", "LLLB"],
      ["bY", "R"],
      ["GB", "L"],
      ["RR", "L"],
      ["0G", "AARR"],
      ["RB", "AAL"],
      ["GB", "ALL"],
      ["yB", "R"],
      ["Br", "LLLA"],
      ["BY", "L"],
      ["GR", "ALL"],
      ["B0", "L"],
      ["rY", "ALL"],
      ["RB", "ALLL"],
      ["BR", "ALL"],
      ["RR", "LLLLR"],
      ["GY", "ALLL"],
      ["BB", "LL"],
      ["0G", "RRA"],
      ["yr", "AALL"],
    ]

    game_state = [
      "      ",
      " Y    ",
      " RR   ",
      " RY   ",
      " BB   ",
      " BB   ",
      " rY y ",
      " GB BG",
      "GGBYYY",
      "RGGYGY",
      "BGGGGG",
      "YY GGG",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_11
    instructions =  [
      ["RR", "LLL"],
      ["RR", "LLL"],
      ["GG", "LLL"],
      ["RR", "LLL"],
      ["YY", "LL"],
      ["YY", "LL"],
      ["BY", "LL"],
      ["BG", "L"],
      ["YY", "L"],
      ["RR", "LL"],
      ["BR", "L"],
      ["Yb", "AAL"],
      ["GG", ""],
      ["BB", "R"],
      ["GG", "R"],
      ["GG", ""],
      ["GB", "BBRR"],
      ["BR", ""],
      ["BY", "RBR"],
      ["BB", "RRRR"],
      ["BB", "AARR"],
      ["yB", "R"],
      ["Bg", "A"],
      ["RR", ""],
      ["Br", ""],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "RR    ",
      "RR    ",
      "G Y   ",
      "GYR   ",
      "RYY   ",
      "RYY   ",
      "RY    ",
      "RYBR G",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_12
    instructions = [
      ["RR", "LLL"],
      ["RR", "LLL"],
      ["GG", "LLL"],
      ["RR", "LLL"],
      ["YY", "LL"],
      ["YY", "LL"],
      ["BY", "LL"],
      ["BG", "L"],
      ["YY", "L"],
      ["RR", "LL"],
      ["BR", "L"],
      ["Yb", "AAL"],
      ["GG", ""],
      ["BB", "R"],
      ["GG", "R"],
      ["GG", ""],
      ["GB", "BBRR"],
      ["BR", ""],
      ["BY", "RBR"],
      ["BB", "RRRR"],
      ["BB", "AARR"],
      ["yB", "R"],
      ["Bg", "A"],
      ["RR", ""],
      ["Br", ""],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "RR    ",
      "RR    ",
      "G Y   ",
      "GYR   ",
      "RYY   ",
      "RYY   ",
      "RY    ",
      "RYBR G",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_13
    instructions = [
      ["BY", "R"],
      ["BY", "RR"],
      ["YY", "L"],
      ["GY", ""],
      ["YB", "LL"],
      ["BG", "LLL"],
      ["00", "R"],
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
      "      ",
      "  YG  ",
      "GYYYYY",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_14
    instructions = [
      ["RR", "L"],
      ["GB", "BBLLL"],
      ["RR", "BRRR"],
      ["YG", "L"],
      ["BB", "BBBL"],
      ["gg", "BBBL"],
      ["Yb", "BBR"],
      ["YB", "LL"],
      ["GB", "BBLL"],
      ["RY", "AA"],
      ["GR", "AA"],
      ["gg", "BB"],
      ["0B", "BB"],
      ["GB", "R"],
      ["RB", "BB"],
      ["RR", "AARRR"],
      ["GY", "LLL"],
      ["GB", "AAALL"],
      ["RB", "AAL"],
      ["GB", "BR"],
      ["Rr", "ALLL"],
      ["RB", "L"],
      ["YG", "AAARR"],
      ["GY", "BBBR"],
      ["RG", ""],
      ["BB", "BR"],
      ["YG", "RR"],
      ["GY", "BBLL"],
      ["RG", "B"],
      ["YY", "A"],
      ["Rb", "L"],
      ["GY", "BLL"],
      ["GG", "AAR"],
      ["RR", "LLL"],
      ["bR", "AAA"],
      ["YG", "AA"],
      ["GB", "BL"],
      ["YG", "AAALLL"],
      ["YB", "AAA"],
      ["BG", "RRR"],
      ["YG", "AAALLL"],
      ["YY", "BBBLL"],
      ["YR", "BBB"],
      ["RG", ""],
      ["BG", "BB"],
      ["RR", "BBBLL"],
      ["GB", "RR"],
      ["YY", "BBBRR"],
      ["BB", "BBR"],
      ["Rg", ""],
      ["BG", "RRR"],
      ["GG", ""],
      ["RB", "BBBRRR"],
      ["YR", ""],
      ["RY", "L"],
      ["BG", "BBR"],
      ["BR", "AAAL"],
      ["RY", "R"],
      ["YR", "BBLLL"],
      ["yb", "BBBRR"],
      ["RB", "BBBR"],
      ["bG", ""],
      ["GB", "AAR"],
    ]

    game_state = [
      "      ",
      "   b  ",
      "  RY  ",
      "  RR  ",
      "RGGRG ",
      "RYRGG ",
      "YGBBYY",
      "BGBBBG",
      "GBRRGY",
      "YGBBGY",
      "BYYYGR",
      "GBGBYR",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_15
    instructions = [
      ["GG", "LR"],
      ["GG", "BLL"],
      ["RR", "LRR"],
      ["RR", "LRRR"],
      ["GG", "L"],
      ["RR", "LBL"],
      ["YY", "LA"],
      ["YY", "LA"],
      ["YY", "LA"],
      ["YY", "LA"],
      ["YY", "ALRR"],
      ["YY", "ALRR"],
      ["YY", "ALRR"],
      ["YY", "BLL"],
      ["BB", "BLL"],
      ["YY", "LBL"],
      ["GG", "LBL"],
      ["YY", "LBL"],
      ["BB", "BLL"],
      ["YY", "LBL"],
      ["BB", "LA"],
      ["BB", "LA"],
      ["YY", "LA"],
      ["BB", "ALRR"],
      ["YY", "ALRR"],
      ["YY", "ALRR"],
      ["BB", "ALRR"],
      ["R0", "LRRR"],
      ["B0", "LRRR"],
      ["YY", "BLRRR"],
      ["BR", "LLL"],
      ["YG", "BLRR"],
      ["YY", "LA"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "   YYY",
      "B YGYB",
      "R YYYY",
      "YYYYYY",
      "YYYYYY",
      "GGYYYY",
      "YYYYYY",
      "YYGG  ",
      "GGGG  ",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_16
    instructions = [
      ["RR", "R"],
      ["gy", "RR"],
      ["Gg", ""],
      ["Yg", "A"],
      ["GB", ""],
      ["BB", "B"],
      ["YG", ""],
      ["gb", "B"],
      ["gB", "LL"],
      ["BY", ""],
      ["GY", "RRR"],
      ["BR", "BB"],
      ["GR", "AARRR"],
      ["YG", "LL"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "   R  ",
      "   B  ",
      "   B R",
      "   Y G",
      "   g G",
      "   Y Y",
      " Y GRg",
      " B YRy",
    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_17
    pend

    game_state = [


    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end

  def test_solves_game_18
    pend

    game_state = [


    ].unlines

    assert_equal game_state, puzzle_fighter(instructions)
  end
end
