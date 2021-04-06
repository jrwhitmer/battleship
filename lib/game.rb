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

  #def player_place_cruiser(cruiser, coordinates)
  #  @player_board.place(cruiser, coordinates)
  #end

  #def computer_place_cruiser(cruiser, coordinates)
    #cruiser = Ship.new("Cruiser", 3)
    #until coordinates.board.valid_placement?
    #coordinates = @computer_board.cells.keys.sample(3)
    #end
    #@computer_board.place(cruiser, coordinates)
  #end

  #def display_player_board_for_player
  #  @player_board.render(true)
  #end

  #def display_computer_board_for_player
  #  @computer_board.render
  #end

end
