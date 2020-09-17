require_relative "./board.rb"
require "byebug"
require "matrix"

class Game

  attr_accessor :board#, :grid

  # I see that this works (from the solution) BUT I don't know why it has to
  # be like this.
  def self.from_file(filename)
    board = Board.from_file(filename)
    self.new(board)
  end

  def initialize(board)
    @board = board
  end

  def play
    until solved?
      render
      idx, num = get_input  
      update_tile(idx, num)
    end
  end

  def update_tile(idx,num)
    board.update_tile(idx, num)
  end

  def solved?
    board.solved?
  end

  def render
    board.render
  end
  
  def []=(idx, val)
    board[idx].value = val
  end

  def get_input
    p "Input an index and your number"
    idx = gets.chomp.split(" ").map(&:to_i)
    num = gets.chomp.to_i
    check_input(idx, num)
    [idx, num]
  end

  def check_input(idx, num)
    raise "Number must be 9 or smaller" if num > 9
    raise "That index is invalid" if idx[0].to_i > 8 || idx[1].to_i > 8
    raise "Number must be positive" if num < 0
  end
end