require 'date'

module Automatic
  def tranny_type
    puts "Your vehicle has an automatic transmission."
  end

  # def shift 
  #   puts "You hear the engine's tone change as your truck shifts gears."
  # end
end

module Towability
  def can_tow? #testing module functionality, will add more to this later.
    puts "This truck can two up to 1200 kilograms!"
  end
end


class Vehicle
  attr_accessor :speed, :on, :color
  attr_reader :year, :model, :gallons
  
  @@number_of_vehicles = 0

  def initialize(year, color, model, gallons)
    @year = year
    @model = model
    @gallons = gallons
    @color = color
    @speed = 0
    @on = false
    @@number_of_vehicles += 1
  end

  def self.mileage(tank, miles)
    miles / tank
  end
  
  def self.total_vehicles_manufactured
    puts @@number_of_vehicles
  end

  def brake
    if speed == 0
      puts "You aren't moving! Yet you keep pushing the brake..."
    elsif speed >= 10
      @speed -= 10
      puts "You slow down to #{speed} kilometers an hour."
    end
  end

  def shut_off
    if on == false 
      puts "Your car is already off."
    else
      @on = false
      puts "You turn off your car. The engine falls silent."
    end
  end

  def turn_on
    if on == false
      @on = true
      puts "The car's engine rumbles and sparks to life."
    else
      puts "Your car is already running!"
    end
  end

  def drive(distance)
    puts "You drive #{distance} miles."
    puts "When you stop in the gas station, you find that your car gets #{Vehicle.mileage(gallons, distance.to_i)} miles per gallon."
  end

  def look_at
    if Time.new.hour >= 17 && Time.new.hour < 19
      puts "The red light of the setting sun sparkles off the paint of your #{model}."
      puts "You feel nostalgic."
    elsif Time.new.hour >= 19 && Time.new.hour < 6
      puts "Your #{model} carves a dark outline in the moon's pale light."
      puts "You feel dangerous. Perhaps you should go find a street race?"
    else
      puts "You gaze at the body of your #{year} #{model}. Its #{color} paint sparkles in the sunlight."
      puts "You feel happy."
    end
  end

  def speed_up
      self.speed += 10
      puts "You speed up to #{speed} kph."
    
  end

  def repaint(color)
    self.color = color
    puts "You changed your car's color to #{self.color}!"
    puts "Mmm, sexy."
  end

  def how_old
    age
  end

  private 


  def age
    puts "This vehicle is #{(Time.now.year - @year).to_i} years old."
  end

end

class MyCar < Vehicle
  
  MAX_SPEED = 180

  def speed_up
    if self.speed != MAX_SPEED
      super
      if self.speed == 120
        puts "The engine purrs, the wind flows past the open window next to your seat."
        puts "You reach serenity..."
      end
    else
      puts "The engine roars, putting forth maximum effort."
      puts "The speedometer is pinned to the max!"
    end
  end

end

class MyTruck < Vehicle

  MAX_SPEED = 140
  include Automatic
  include Towability
  def speed_up
    if self.speed != MAX_SPEED
      super
      if self.speed == 120
        puts "The engine rumbles, the wind flows past the open window next to your seat."
        puts "You feel calm. If you had a dog, he'd probably be sticking his head out of the window."
      end
    else
      puts "The engine roars, putting forth maximum effort."
      puts "Your fuel gauge needle slowly trickles downward..."
    end
  end
end




