require 'singleton'

class Player
  include Singleton

  attr_accessor :name, :score

  def initialize
    @name = "Default Player"
    @score = 0
  end

  def display_info
    puts "Name: #{@name}, Score: #{@score}"
  end
end
