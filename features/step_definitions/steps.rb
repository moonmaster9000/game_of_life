Given(/^a cell with fewer than two neighbors$/) do
  @game = Game.new [
    [0, 1],
    [0, 0]
  ]
end

When(/^the clock ticks$/) do
  @game.tick
end

Then(/^it should die$/) do
  @game.grid.should == [
    [0, 0],
    [0, 0]
  ]
end
