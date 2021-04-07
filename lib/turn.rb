require './lib/game'

class Turn
  attr_reader :game
  def initialize
    @game = Game.new
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    @game.display_computer_board_for_player
    puts "==============PLAYER BOARD=============="
    @game.display_player_board_for_player
  end

  
end
