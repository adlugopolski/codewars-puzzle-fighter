require "test/unit"
require "test/unit/rr"

base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
game_dir = File.join(base_dir, "src")
test_dir = File.join(base_dir, "test")

$LOAD_PATH.unshift(game_dir)

exit Test::Unit::AutoRunner.run(true, test_dir)
