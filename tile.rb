class Tile

  attr_accessor :given, :value
  def initialize(value)
    @given = value == 0 ? true : false
    @value = value
  end

  def to_s 
    @value == 0 ? " " : @value.to_s.colorize #how to use that plugin?
  end

  def value=(new_val)
    if @given
      # they have "if given?" and have a def given? / @given / end
      puts "You can't change this value."
    else 
      @value = new_val
    end
  end

  # HOW DOES THIS WORK????
  # they have given?
  def color 
    @given ? :blue : :red
  end


  
end