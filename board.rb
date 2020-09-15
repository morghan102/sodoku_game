require_relative "./tile.rb"
require "byebug"
require "matrix"


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


  # i dont get how this works... pls come back and look through!
  def square(idx)
    tiles = []
    x = (idx / 3) *3
    y = (idx % 3) * 3

    (x...x+3).each do |i|
      (y...y+3).each do |j|
        # debugger
        tiles << self[[i,j]]
      end
    end
    tiles
  end

  def rows
    grid.map { |row| values(row) }
  end

  def columns
    grid.transpose.map { |col| values(col) }
  end
  
  def columns
    grid.transpose.map { |col| values(col) }
  end

  def squares 
    (0...9).map { |i| values(square(i)) }
  end
  # self of double arr ??? self[[0,4]] why that work?? 
  # but not grid[0,4], output is something else entirely


  def rows_solved?
    rows.all? { |r| r.sort == (1..9).to_a }
  end

  def columns_solved?
    columns.all? { |c| c.sort == (1..9).to_a }
  end

  def squares_solved?
    squares.all? { |sq| sq.sort == (1..9).to_a }
  end

  def solved?
    return true if rows_solved? && columns_solved? && squares_solved?
    false
  end

end