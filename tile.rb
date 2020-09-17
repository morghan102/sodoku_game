require "byebug"
require "colorize"

class Tile

  attr_accessor :given, :value #need this? at the lst, meybs not given

  def initialize(value)
    @given = value == 0 ? false : true
    @value = value
  end

  def given?
    @given
  end
  
  def to_s 
    value == 0 ? " " : value.to_s.colorize(color)
  end

  def value=(new_val)
    if given?
      puts "You can't change this value."
    else 
      @value = new_val
    end
  end

  def color 
    given? ? :blue : :red
  end  
end