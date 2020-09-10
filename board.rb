require_relative "./tile.rb"
require "byebug"


class Board

  attr_accessor :grid

  def initialize
    @grid = grid
  end

  def self.from_file(filename) #class method... factory method?
    File.readlines(filename).map do |row|
      row.chomp.split("").map do |tile|
        Tile.new(tile.to_i)
      end
    end
  end

end