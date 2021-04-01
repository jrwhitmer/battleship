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
    if @ship != nil
      @ship.hit
    end
    @fired_upon = true
  end

  def render(visibility = false)
    if visibility && fired_upon? == false
      "S"
    elsif fired_upon? == false
      "."
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && empty? == false && @ship.sunk?
      "X"
    elsif fired_upon? && empty? == false
      "H"

    end
  end
end
