require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells,
              :coordinate_numbers
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
    @coordinate_numbers = nil
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def consecutive_letters?(ship, coordinates)
    ordinate_values = coordinates.map do |coordinate|
      coordinate.ord
    end
    ordinate_values.each_cons(ship.length).all? do |coordinate, next_coordinate|
      next_coordinate == coordinate + 1
    end
  end

  def grab_numbers_from_coordinates(coordinates)
    split_coordinates = coordinates.map do |coordinate|
      coordinate.split("")
    end
    split_coordinates.flatten!

    @coordinate_numbers = split_coordinates.find_all do |split_coordinate|
      split_coordinate.to_i >= 1
    end
    @coordinate_numbers.flatten!

    @coordinate_numbers = @coordinate_numbers.map do |coordinate_number|
      coordinate_number.to_i
    end
  end

  def consecutive_numbers?(ship, coordinates)
    grab_numbers_from_coordinates(coordinates)
    if ship.length == 3
    @coordinate_numbers.each_cons(3).all? do |coordinate, next_coordinate, last_coordinate|
      next_coordinate == coordinate + 1
      last_coordinate == next_coordinate + 1
    end
    elsif ship.length == 2
      @coordinate_numbers.each_cons(2).all? do |coordinate, next_coordinate|
        next_coordinate == coordinate + 1
      end
    end
  end

  def consecutive?(ship, coordinates)
    consecutive_letters?(ship, coordinates) || consecutive_numbers?(ship, coordinates)
  end

  def not_diagonal?(ship, coordinates)
    if consecutive_letters?(ship, coordinates) && consecutive_numbers?(ship, coordinates)
      false
    else
      true
    end
  end

  def valid_length?(ship, coordinates)
    # why can't we access the instance variable itself-- @length here?
    ship.length == coordinates.length
  end

  def valid_placement?(ship, coordinates)
    valid_length?(ship, coordinates) && consecutive?(ship, coordinates) && not_diagonal?(ship, coordinates)
  end
end
