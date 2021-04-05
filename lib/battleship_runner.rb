require './lib/game'

game = Game.new

player_cruiser = Ship.new("Cruiser", 3)

game.player_place_cruiser(player_cruiser, gets.chomp)
p game.display_player_board_for_player

require 'pry'; binding.pry
#game.computer_place_cruiser
#game.display_computer_board_for_player
