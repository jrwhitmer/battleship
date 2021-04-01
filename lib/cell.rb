require './lib/ship'
class Cell

  attr_reader :coordinate,
              :ship
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    ship.hit
    @fired_upon = true
  end

  def render
    if fired_upon? == false
       "."
     end 
  end
end
