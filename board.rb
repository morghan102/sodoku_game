require_relative "./tile.rb"
require "byebug"

class Board

  def self.from_file(filename) #class method... factory method?
    rows = File.readlines(filename).map do |row|
      row.chomp.split("").map { |tile| Tile.new(tile.to_i) }
    end
    self.new(rows) 
  end

# def self.empty_grid
#   Array.new(9) do 
#     Array.new(9) {Tile.new(0)}
#   end
# end
# i dont get why we start w this empty grid... meybs to link "self"?
# NO bc the empty grid is for playing and the file is the solution


  attr_accessor :grid

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end

  def update_tile(idx, val)
    self[idx] = val
  end

  def [](idx)
    row, col = idx
    grid[row][col]
  end

  def []=(idx, val)
    row, col = idx
    grid[row][col].value = val
  end

  def render 
    puts
    grid.each_with_index do |row, row_i|
      row_i % 3 == 0 && row_i != 0 ? (print "-------------\n") : (print "")
      row.each_with_index do |tile, i|
        i % 3 == 0 ? (print "|") : (print "")
        print tile.to_s
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