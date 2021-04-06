require './lib/game'

@game = Game.new
@player_cruiser = Ship.new("Cruiser", 3)
@player_submarine = Ship.new("Submarine", 2)
@computer_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)

puts "Welcome to BATTLESHIP!!!"
puts "Enter p to play. Enter q to quit forever."


if @game.main_menu?(gets.chomp)

#@game.computer_place_cruiser(@computer_cruiser, coordinates)
#@game.computer_place_submarine(@computer_submarine, coordinates)

puts "I have laid out my ships on the grid."
puts "You now need to lay out your two ships."
puts "The cruiser is three units long and the Submarine is two units long."
puts "I know because I created them."
puts "Here is a visual representation of your board."

puts "  1 2 3 4 \n" +
     "A  . . . . \n" +
     "B  . . . . \n" +
     "C  . . . . \n" +
     "D  . . . . \n"

puts "Enter the squares for the Cruiser (3 spaces), so I may destroy you more promptly:"
puts "Please enter in the following format: Ex: A1 A2 A3"

@game.player_place_cruiser(@player_cruiser, gets.chomp)

puts "Enter the squares for the submarine (2 spaces) in the same format:"

@game.player_place_submarine(@player_submarine, gets.chomp)

puts "Prepare to lose."

end








#game.player_place_cruiser(player_cruiser, gets.chomp)
#p game.display_player_board_for_player

#require 'pry'; binding.pry
#game.computer_place_cruiser
#game.display_computer_board_for_player