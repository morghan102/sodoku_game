require_relative "./tile.rb"
require "byebug"


class Board

  def self.from_file(filename) #class method... factory method?
    # they 1st put all rows into its own arr, the pieces being the rows 
    rows = File.readlines(filename).map do |row|
      row.chomp.split("").map do |tile|
        Tile.new(tile.to_i)
      end
    end
    self.new(rows) 
  end

def self.empty_grid
  Array.new(9) do 
    Array.new(9) {Tile.new(0)}
  end
end
# i dont get why we start w this empty grid... meybs to link "self"?
# NO bc the empty grid is for playing and the file is the solution


  attr_accessor :grid

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end



  def [](idx)
    row, col = idx
    grid[row][col]
  end

  def []=(idx, val)
    row, col = idx
    grid[row][col].value = val
  end

  def render #shd the board be divided somehow into the squares?
    puts
    grid.each_with_index do |row, row_i|
      row_i % 3 == 0 && row_i != 0 ? (print "-------------\n") : (print "")
      row.each_with_index do |tile, i|
        i % 3 == 0 ? (print "|") : (print "")
        print tile.value
      end
      print "|\n"
    end
    puts
  end

  def values(arr)
    arr.map do |tile|
      tile.value
    end
  end
# these 2 (row & column) are probs right but it's hard to tell w all 0 values
  def row(idx)
    grid.map { |row| values(row) }[idx]
  end

  def column(idx)
    grid.transpose.map { |row| values(row) }[idx]
  end

  def square(idx)
    # i can figure this out but atm my mind just wont
  end

  def solved?
    return true if 
    false
  end

end