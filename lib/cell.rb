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

  def render_not_fired_upon?
    fired_upon? == false
  end

  def render_miss?
    fired_upon? && empty?
  end

  def render_sunk?
    fired_upon? && empty? == false && @ship.sunk?
  end

  def render_hit?
    fired_upon? && empty? == false
  end

  def render(visibility = false)
    if visibility && fired_upon? == false && empty? == false
      "S"
    elsif render_not_fired_upon?
      "."
    elsif render_miss?
      "M"
    elsif render_sunk?
      "X"
    elsif render_hit?
      "H"
    end
  end
end
