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
    while @player_board.valid_placement?(cruiser, coordinates) == false
      puts "Those are invalid coordinates. Please try again."
      coordinates = gets.chomp
      coordinates = coordinates.split
    end
    @player_board.place(cruiser, coordinates)
    display_player_board_for_player
  end

  def player_place_submarine(submarine, coordinates)
    coordinates = coordinates.split
    while @player_board.valid_placement?(submarine, coordinates) == false
      puts "Those are invalid coordinates. Please try again."
      coordinates = gets.chomp
      coordinates = coordinates.split
    end
    @player_board.place(submarine, coordinates)
    display_player_board_for_player
  end

# optional hard code coordinates for swift endgame testing
  # def computer_place_cruiser(cruiser)
    # coordinates = ["D2", "D3", "D4"]
    # @computer_board.place(cruiser, coordinates)
  # end

  # def computer_place_submarine(submarine)
    # coordinates = ["B3", "C3"]
    # @computer_board.place(submarine, coordinates)
  # end

  def computer_place_cruiser(cruiser)
    coordinates =  @computer_board.cells.keys.sample(3)
    while @computer_board.valid_placement?(cruiser, coordinates) == false
    coordinates = @computer_board.cells.keys.sample(3)
    end
    @computer_board.place(cruiser, coordinates)
 end

  def computer_place_submarine(submarine)
   coordinates =  @computer_board.cells.keys.sample(2)
   while @computer_board.valid_placement?(submarine, coordinates) == false
   coordinates = @computer_board.cells.keys.sample(2)
   end
   @computer_board.place(submarine, coordinates)
  end

  def display_player_board_for_player
    puts @player_board.render(true)
  end

  def display_computer_board_for_player
    puts @computer_board.render
  end

end
