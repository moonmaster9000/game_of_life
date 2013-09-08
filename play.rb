require_relative "./game"

game = Game.new [
  [0,0,0,0,0],
  [0,0,1,0,0],
  [0,0,1,0,0],
  [0,0,1,0,0],
  [0,0,0,0,0],
]

while true
  game.grid.each do |row|
    puts row.inspect
  end
  game.tick
  sleep 1
  puts ("\e[1A" * (game.grid.count + 1))
end
