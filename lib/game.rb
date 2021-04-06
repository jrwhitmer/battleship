require './lib/ship'
require './lib/cell'
require './lib/board'


class Game

  attr_reader :player_board,
              :computer_board
  def initialize
    @turns = []
    @player_board = Board.new
    @computer_board = Board.new
  end

  def main_menu?(input)
    if input == "q"
      # add functionality for an are you sure?
      puts "Goodbye."
      return false
    elsif input == "p"
      puts "Here we go!"
      return true
    else
      puts "Follow directions. Try again."
      return false
    end
  end

  def player_place_cruiser(cruiser, coordinates)
    coordinates = coordinates.split
    # Why does this print "This is not a valid placement" when condition is not true?
    while @player_board.place(cruiser, coordinates) == "This is not a valid placement for this ship!"
      puts "Try again."
      coordinates = gets.chomp
      coordinates = coordinates.split
    end
    @player_board.place(cruiser, coordinates)
    display_player_board_for_player
  end

  def player_place_submarine(submarine, coordinates)
    coordinates = coordinates.split
    while @player_board.place(submarine, coordinates) == "This is not a valid placement for this ship!"
      puts "Try again."
      coordinates = gets.chomp
      coordinates = coordinates.split
    end
    @player_board.place(submarine, coordinates)
    display_player_board_for_player
  end

  def computer_place_cruiser(cruiser, coordinates)
    cruiser = Ship.new("Cruiser", 3)
    until coordinates.board.valid_placement?
    coordinates = @computer_board.cells.keys.sample(3)
    end
    @computer_board.place(cruiser, coordinates)
  end

  def computer_place_submarine(submarine, coordinates)

  end

  def display_player_board_for_player
    puts @player_board.render(true)
  end

  def display_computer_board_for_player
    puts @computer_board.render
  end

end
