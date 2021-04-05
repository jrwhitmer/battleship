require './ship'
require './cell'
require './board'


class Game

  def initialize(turns)
    @turns = []
    @player_board = Board.new
    @computer_board = Board.new
  end

  def player_place_cruiser(cruiser, coordinates)
    cruiser = Ship.new("Cruiser", 3)
    @player_board.place(cruiser, gets.chomp)
  end

  def computer_place_cruiser(cruiser, coordinates)
    cruiser = Ship.new("Cruiser", 3)
    until coordinates.board.valid_placement?
    coordinates = @computer_board.cells.keys.sample(3)
    end
    @computer_board.place(cruiser, coordinates)
  end

end
