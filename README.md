# Puzzle Fighter
![GitHub Logo](/puzzle_demo.png)

This is a generic implementation of a
[Code Wars](https://codewars.com)
Kata available called
[Puzzle Fighter](https://www.codewars.com/kata/puzzle-fighter/ruby)
in Ruby. In short it is a reimplementation of an engine from games like
[Super Puzzle Fighter II Turbo](https://en.wikipedia.org/wiki/Super_Puzzle_Fighter_II_Turbo).
One of the modern examples of such games is
[Crystal Crysis](https://www.metacritic.com/game/switch/crystal-crisis).
Whole implementation is contained in one file `app.rb` due to the fact Code
Wars requires inline solution.

While solving this Kata I was trying to avoid mutation as much possible. Every
time new state change was introduced new representation of whole state of
game board was created and returned with the change applied. This resulted in
possibility to create command pipelines, like:

```ruby
def call
  @blocks
    .then(&Rainbow)
    .then(&PowerCombiner)
    .then(&method(:crash_logic))
    .then(&PowerCombiner)
    .then(&PowerExpander)
    .then(&PowerMerger)
end
```

End result is quite slow. bWith some trivial caching tricks it managed to pass
Code Wars test suite with limit of 12s in just about 8 seconds.

I encourage everyone to try to create own implementation. This task includes
many intreresting caveats. It encourages patters, which are rarely used, if
most of what you do on daily basis is Web development.<Paste>
