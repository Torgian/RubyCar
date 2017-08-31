require 'date'

class Vehicle
  attr_accessor :speed, :on, :color
  attr_reader :year, :model, :gallons
  def initialize(year, color, model, gallons)
    @year = year
    @model = model
    @gallons = gallons
    @color = color
    @speed = 0
    @on = false
  end
  
  @@miles_per_gallon = 0

  def self.mileage(tank, miles)
    @@miles_per_gallon = miles / tank
  end
  
  def brake
    if self.speed == 0
      puts "You aren't moving! Yet you keep pushing the brake..."
    elsif self.speed >= 10
      self.speed -= 10
      puts "You slow down to #{self.speed} kilometers an hour."
    end
  end

  def shut_off
    if self.on == false 
      puts "Your car is already off."
    else
      self.on = false
      puts "You turn off your car. The engine falls silent."
    end
  end

  def turn_on
    if self.on == false
      self.on = true
      puts "The car's engine rumbles and sparks to life."
    else
      puts "Your car is already running!"
    end
  end

  def drive(distance)
    puts "You drive #{distance} miles."
    Vehicle.mileage(self.gallons, distance.to_i)
    puts "When you stop in the gas station, you find that your car gets #{@@miles_per_gallon} miles per gallon."
  end

  def look_at
    if Time.new.hour >= 17 && Time.new.hour < 19
      puts "The red light of the setting sun sparkles off the paint of your #{model}."
      puts "You feel nostalgic."
    elsif Time.new.hour >= 19 && Time.new.hour < 6
      puts "Your #{model} carves a dark outline in the moon's pale light."
      puts "You feel dangerous. Perhaps you should go find a street race?"
    else
      puts "You gaze at the body of your #{self.year} #{self.model}. Its #{color} paint sparkles in the sunlight."
      puts "You feel happy."
    end
  end

  def repaint(color)
    self.color = color
    puts "You changed your car's color to #{self.color}!"
    puts "Mmm, sexy."
  end

end

class MyCar < Vehicle

  attr_reader :max_speed

  def initialize(year, color, model, gallons)
    super(year, color, model, gallons)
  end
  
  MAX_SPEED = 180

  def speed_up
    if self.speed != MAX_SPEED
      self.speed += 10
      puts "You speed up to #{self.speed} kph."
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

  attr_reader :max_speed

  def initialize(year, color, model, gallons)
    super(year, color, model, gallons)
  end

  MAX_SPEED = 140

  def speed_up
    if self.speed != MAX_SPEED
      self.speed += 10
      puts "You speed up to #{self.speed} kph."
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




