class Game
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def tick
    new_grid = []
    grid.each_with_index do |row, row_number|
      new_row = []

      row.each_with_index do |cell, cell_number|
        neighbor_below = if grid[row_number +1]
                           grid[row_number + 1][cell_number]
                         else
                           nil
                         end

        neighbor_above = if row_number - 1 >= 0
                           grid[row_number -1][cell_number]
                         else
                           nil
                         end

        neighbor_ahead = grid[row_number][cell_number + 1]

        neighbor_behind = if cell_number - 1 >= 0
                            grid[row_number][cell_number - 1]
                          else
                            nil
                          end

        neighbors = [neighbor_above, neighbor_ahead, neighbor_behind, neighbor_below]


        live_neighbors = neighbors.select { |n| n == 1 }.count

        if cell == 1 && (live_neighbors == 2 || live_neighbors == 3)
          new_row[cell_number] = 1
        elsif cell == 0 && live_neighbors == 3
          new_row[cell_number] = 1
        else
          new_row[cell_number] = 0
        end
      end

      new_grid << new_row
    end

    @grid = new_grid
  end
end
