
require './lib/cell'
require './lib/game'

class Turn
  attr_reader :game
  def initialize
    @game = Game.new
    @player_shots = []
    @computer_shots = []
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    @game.display_computer_board_for_player
    puts "==============PLAYER BOARD=============="
    @game.display_player_board_for_player
  end

  def player_shot(coordinate)
    while @player_shots.include?(coordinate)
      @player_shots << coordinate
      puts "You did that already. I guess I'll let you try again."
      coordinate = gets.chomp
    end
      @game.computer_board.cells[coordinate].fire_upon
    #if cruiser_sunk_check? && submarine_sunk_check?
      #end_game
    #elsif cruiser_sunk_check? || submarine_sunk_check?
      #"You sunk a ship! Never again."
    #end
    player_results(coordinate)
  end

  def computer_shot
    coordinate = @game.player_board.cells.keys.sample(1)
    coordinate = coordinate.join
    while @player_shots.include?(coordinate)
      @computer_shots << coordinate
      coordinate = @game.player_board.cells.keys.sample(1)
      coordinate = coordinate.join
    end
    @game.player_board.cells[coordinate].fire_upon
  end

  def player_results(coordinate)
    if @game.computer_board.cells[coordinate].render_miss?
      puts "Your shot on #{coordinate} was a miss."
    elsif @game.computer_board.cells[coordinate].render_hit?
      if @game.computer_board.cells[coordinate].sunk?
        puts "Your shot on #{coordinate} sunk my ship."
      else
        puts "Your shot on #{coordinate} was a hit."
      end
    end
  end

  def computer_results

  end
end
