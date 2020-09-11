require_relative "./board.rb"
require "byebug"

class Game

#   attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play
    until @board.solved?
        @board.render
        get_input 
    end
  end

  def get_input
    p "Input an index and the number"
    idx = gets.chomp.split(" ").map {|i| i.to_i}
    num = gets.chomp.to_i
    check_input(idx, num)
    # how to return input to play?
  end

  def check_input(idx, num)
    raise "Number must be 9 or smaller" if num > 9
    raise "That index is invalid" if idx[0].to_i > 8 || idx[1].to_i > 8
    # not sure if the or there will be read
  end

#   next ust update tile at that idx

end