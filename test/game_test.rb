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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
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

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_17
    instructions = [
      ["BB", "LL"],
      ["Bb", "AL"],
      ["yb", "BR"],
      ["GG", "AAL"],
      ["BR", "AAAR"],
      ["GR", "BLLL"],
      ["RY", "BBLLL"],
      ["YR", "BLL"],
      ["RY", "AAARRR"],
      ["GY", "BRRR"],
      ["yr", "BB"],
      ["rY", "BBBRR"],
      ["RR", "AAR"],
      ["G0", "AAR"],
      ["GR", "R"],
      ["BR", "BBBLLL"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "B     ",
      "R   G ",
      "Y   R ",
      "RR  BY",
      "RY byR",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_18
    instructions = [
      ["BR", "AARRR"],
      ["YR", "BBB"],
      ["Rg", "R"],
      ["RB", "AAAL"],
      ["BB", "BBBLLL"],
      ["By", "LL"],
      ["YB", "AALL"],
      ["GY", "BL"],
      ["gB", "AR"],
      ["GY", "AR"],
      ["RY", "ARR"],
      ["GY", "BBBRRR"],
      ["RY", "BBB"],
      ["R0", "BL"],
      ["RG", "BRR"],
      ["YG", "B"],
    ]

    game_state = [
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "      ",
      "    G ",
      "    G ",
      " BG RR",
      " BR RB",
      " BGYgR",
      "BBRRRB",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_19
    instructions = [
      ["BB", "B"],
      ["YG", ""],
      ["YG", "AAA"],
      ["GY", "AAR"],
      ["YR", "BBBRRR"],
      ["YY", "ALL"],
      ["rB", "AARRR"],
      ["RG", "R"],
      ["by", "AARR"],
      ["YR", ""],
      ["Yg", "RR"],
      ["GR", "BBB"],
      ["YY", "L"],
      ["BG", "L"],
      ["YY", "BBBLL"],
      ["RG", "AAALL"],
      ["GR", "BBBLLL"],
      ["YY", "AAR"],
      ["RB", "A"],
      ["YR", "BBBL"],
      ["GY", "AAAR"],
      ["RG", "ALL"],
      ["GG", "BBRRR"],
      ["GR", "BB"],
      ["yB", "BLL"],
      ["BB", "AAARR"],
      ["YR", "AAAR"],
      ["rY", "AARRR"],
      ["BR", "RR"],
      ["GB", "ALL"],
      ["BY", "B"],
      ["BY", "BBL"],
      ["R0", "BBB"],
      ["RB", "BBRR"],
      ["RG", ""],
      ["BB", "AAALLL"],
      ["YG", "BBBR"],
      ["BY", "BBRR"],
      ["BR", "LLL"],
      ["RR", "BR"],
      ["RB", ""],
      ["RG", "AR"],
      ["BY", ""],
      ["RY", ""],
      ["bb", "ALLL"],
      ["rg", "BBRRR"],
    ]

    game_state = [
      "   R  ",
      "   G  ",
      "   R  ",
      "   B Y",
      "   R B",
      "   R G",
      "B BGYB",
      "RBBRBR",
      "BGGRGB",
      "BRBGBB",
      "GRGRRG",
      "GRBBRG",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_20
    instructions = [
      ["bG", "ALL"],
      ["GG", "BBBL"],
      ["GB", "R"],
      ["gy", "AL"],
      ["BR", "LL"],
      ["BG", "RR"],
      ["RR", "AA"],
      ["BB", "R"],
      ["RR", "AR"],
      ["BR", "AAA"],
      ["YB", "AAA"],
      ["RY", "AA"],
      ["YB", "L"],
      ["GG", "BBLLL"],
      ["GR", "BBRRR"],
      ["bG", "AAAR"],
      ["YB", "AAL"],
      ["RR", "RR"],
      ["0R", "A"],
      ["BG", "L"],
      ["gR", "AAR"],
      ["RG", "AAAR"],
      ["RG", "BLL"],
      ["RB", "BBB"],
      ["RG", "LL"],
      ["Y0", "LLL"],
      ["B0", ""],
      ["GY", "BBB"],
      ["RY", "LLL"],
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
      "R     ",
      "Y     ",
      "Y  GY ",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_21
    instructions = [
      ["YR", "LLL"],
      ["bG", "LA"],
      ["gR", "AALA"],
      ["RR", "LBLL"],
      ["RG", "L"],
      ["GY", "AAALR"],
      ["By", "LLL"],
      ["YG", "LLL"],
      ["RY", "LLLL"],
      ["RG", "LA"],
      ["YY", "LB"],
      ["YB", "BLRRR"],
      ["Gb", "BBBLRR"],
      ["yb", "BBLRR"],
      ["Y0", "LBLL"],
      ["YG", "BBLBLLL"],
      ["RG", "BBBLRRR"],
      ["GB", "LALL"],
      ["RY", "BBBLL"],
      ["GG", "ALAAL"],
      ["RB", "LL"],
      ["RR", "LBB"],
      ["YG", "BBBLR"],
      ["YG", "ALL"],
      ["BY", "BLRRR"],
      ["YG", "BBLLL"],
    ]

    game_state = [
      "      ",
      "      ",
      "G     ",
      "Y     ",
      "G     ",
      "GY    ",
      "YRG Y ",
      "YBR G ",
      "YGRYR ",
      "GRYGyG",
      "BBYGGb",
      "YGbGBY",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_22
    instructions = [
      ["RY", "R"],
      ["RR", "RRR"],
      ["RY", "LL"],
      ["BG", "ARRR"],
      ["YR", ""],
      ["GY", "RR"],
      ["YY", "B"],
      ["GB", ""],
      ["GR", "ALL"],
      ["GR", "AALL"],
      ["bG", "B"],
      ["BY", "BBR"],
      ["GG", "B"],
      ["GR", "BB"],
      ["RY", "BBBRRR"],
      ["yY", "BLLL"],
      ["RR", "BB"],
      ["By", "AAL"],
      ["00", "AAR"],
      ["gb", "BBLL"],
      ["GR", "R"],
      ["Bb", "AARR"],
      ["RB", "ALLL"],
      ["bG", "BRR"],
      ["RY", "BBLL"],
      ["YR", ""],
      ["GY", "AARRR"],
      ["RB", "A"],
      ["YG", "AAALL"],
      ["BG", "LLL"],
      ["gR", "BBLL"],
      ["0B", "A"],
      ["YB", "BL"],
      ["YR", "LLL"],
      ["GR", "ARR"],
      ["GR", "BB"],
      ["YY", "A"],
      ["RR", "L"],
      ["YG", "AAA"],
      ["YR", "R"],
      ["BR", "AAALL"],
      ["GB", "L"],
    ]

    game_state = [
      "   Y  ",
      "   YY ",
      "   RG ",
      "   GB ",
      "   YBR",
      "   GGY",
      "Y  GGG",
      "RB b b",
      "BYRGYY",
      "GYRBBG",
      "GBYYBY",
      "YYYYYG",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_23
    instructions = [
      ["BG", "AAAR"],
      ["RY", "AL"],
      ["bR", ""],
      ["RB", "BBL"],
      ["B0", "BB"],
      ["BR", "LL"],
      ["gR", "AA"],
      ["RB", "L"],
      ["BR", "BBRRR"],
      ["BR", "BBRR"],
      ["BY", "RRR"],
      ["YR", "BB"],
      ["YB", "AALL"],
      ["GB", ""],
      ["RG", "AAR"],
      ["BB", "BBB"],
      ["GG", "L"],
      ["RR", "BRR"],
      ["GB", "ALLL"],
      ["RG", "ALL"],
      ["BG", "AA"],
      ["BG", "AAARR"],
      ["R0", "AAA"],
      ["Gb", "LL"],
      ["gY", "BRRR"],
      ["RY", "BBBRR"],
      ["GY", "AARR"],
      ["YR", "AAR"],
      ["bG", "BLL"],
    ]

    game_state = [
      "   G  ",
      "   B  ",
      "   B  ",
      "   G  ",
      "   B B",
      "  GR R",
      " RGY B",
      " BGRGY",
      " BRgRR",
      " YBRBB",
      " BRYGR",
      "GRRGRB",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_24
    instructions = [
      ["YY", "B"],
      ["RY", "AALL"],
      ["BG", "BBRR"],
      ["BB", "R"],
      ["BG", "BBBRR"],
      ["BG", "ALLL"],
      ["GR", "AA"],
      ["RY", "BBBLLL"],
      ["Yy", "BBRRR"],
      ["GG", "BB"],
      ["BR", "RR"],
      ["by", "R"],
      ["YY", ""],
      ["BG", ""],
      ["BY", "B"],
      ["RG", "BRRR"],
      ["BG", "AAAL"],
      ["G0", "RRR"],
      ["Gy", "BBRR"],
      ["YY", "BBL"],
      ["RG", "L"],
      ["YG", "BBR"],
      ["YG", "BL"],
      ["GR", "AR"],
      ["RG", "A"],
      ["yB", "BBLL"],
      ["YG", "BBRRR"],
      ["G0", "LL"],
      ["BR", "BBB"],
      ["GB", "BBBLLL"],
      ["YB", "AAR"],
      ["BG", "RR"],
      ["BY", ""],
      ["Gg", "BLLL"],
      ["RG", "B"],
      ["BG", "AAL"],
      ["RG", "B"],
      ["GY", "R"],
      ["BB", "AAARR"],
      ["GG", "BBBR"],
      ["BR", "BR"],
      ["RB", "RR"],
      ["YB", "BBLL"],
      ["RB", "A"],
      ["BG", "AAA"],
      ["GY", "AARR"],
      ["YY", "BBL"],
      ["RG", "RRR"],
      ["RG", "BBBL"],
      ["RR", "L"],
      ["RB", "BB"],
      ["Ry", "BLLL"],
      ["yB", "LL"],
      ["GY", "ALLL"],
      ["GG", "AAARR"],
      ["YG", "BBRR"],
      ["BB", "AAAL"],
      ["GY", "BBR"],
      ["BR", "AAA"],
      ["By", ""],
      ["GG", ""],
      ["RG", ""],
    ]

    game_state = [
      "      ",
      "     Y",
      "     G",
      "   BBR",
      " BYRBB",
      " YYRGG",
      " GGRBB",
      " BGRGB",
      " GGBYG",
      " GBYBG",
      " GGBYY",
      " YRRRR",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def test_solves_game_26
    instructions = [
      ["BY", "AALLL"],
      ["BB", "LL"],
      ["GR", "BBLRR"],
      ["RR", "LA"],
      ["BY", "AAALLL"],
      ["YG", "LBB"],
      ["BY", "BLRRR"],
      ["GR", "AAALRRR"],
      ["Rr", "LAALLL"],
      ["YY", "ALA"],
      ["BG", "LLL"],
      ["br", "LL"],
      ["RR", "L"],
      ["BY", "L"],
      ["BR", "LA"],
      ["GY", "ALLLL"],
      ["BY", "BBBLR"],
      ["Y0", "LLLL"],
      ["Yr", "LAALL"],
      ["RR", "AALR"],
      ["GY", "LR"],
      ["RY", "ALAL"],
      ["RY", "ALR"],
      ["YG", "BLL"],
      ["RY", "AALLLL"],
      ["GY", "LB"],
      ["rB", "AALRR"],
      ["Y0", "LRR"],
      ["BG", "ALAA"],
      ["YB", "AAALRRR"],
      ["BR", "L"],
      ["Yy", "ALRRR"],
      ["BY", "LLL"],
      ["RB", "LBBL"],
      ["GY", "LA"],
      ["BY", "BBLR"],
      ["GY", "LA"],
      ["YR", "LL"],
      ["BB", "LBBBLL"],
      ["YY", "AAALL"],
      ["BG", "LAL"],
      ["GB", "LLL"],
      ["RB", "AALRR"],
      ["GB", "LB"],
      ["BY", "BBLB"],
      ["YR", "LBBLL"],
      ["RR", "AALR"],
      ["GY", "LLLL"],
      ["GY", "L"],
      ["RY", "AALLL"],
      ["BG", "BBLB"],
      ["GG", "LR"],
      ["Br", "L"],
      ["Gr", "ALRRR"],
      ["YR", "ALAL"],
      ["rB", "LRR"],
      ["GY", "AAALR"],
      ["YY", "LBBBLL"],
      ["GB", "ALA"],
      ["YR", "BLRRR"],
      ["YY", "L"],
      ["BB", "BBBLR"],
    ]

    game_state = [
      "      ",
      "R     ",
      "Y     ",
      "GBB   ",
      "BBGRB ",
      "YYGRR ",
      "BBGYY ",
      "BYGYB ",
      "YRBYY ",
      "YBRBY ",
      "RRBYY ",
      "GGGGR ",
    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def xtest_solves_game_27
    pend

    game_state = [


    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end

  def xtest_solves_game_28
    pend

    game_state = [


    ].unlines

    assert_equal game_state, PuzzleFighter.call(instructions)
  end
end
