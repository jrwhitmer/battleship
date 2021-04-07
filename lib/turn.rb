
require './lib/cell'
require './lib/game'

class Turn
  attr_reader :game
  def initialize
    @game = Game.new
    @player_shots = []
    @computer_shots = []
    @player_ship_hits = []
    @computer_ship_hits = []
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

    player_results(coordinate)
    if @game.computer_board.cells[coordinate].render_hit?
      @computer_ship_hits << coordinate
    end
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

    computer_results(coordinate)
    if @game.player_board.cells[coordinate].render_hit?
      @player_ship_hits << coordinate
    end
  end

  def player_results(coordinate)
    if @game.computer_board.cells[coordinate].render_miss?
      puts "Your shot on #{coordinate} was a miss. Nya Nya Nya."
    elsif @game.computer_board.cells[coordinate].render_hit?
      if @game.computer_board.cells[coordinate].render_sunk?
        puts "Your shot on #{coordinate} sunk my ship. Is this what you humans call luck?"
      else
        puts "Your shot on #{coordinate} was a hit. All a part of my plan."
      end
    end
  end

  def computer_results(coordinate)
    if @game.player_board.cells[coordinate].render_miss?
      puts "My shot on #{coordinate} was a miss. But it is only a matter of time before I find you."
    elsif @game.player_board.cells[coordinate].render_hit?
      if @game.player_board.cells[coordinate].render_sunk?
        puts "My shot on #{coordinate} sunk your ship. As I expected. Do you wish to give up?"
      else
        puts "My shot on #{coordinate} was a hit. But it was no Tubthumping, more like a pre-released Mariah Carey single. In that I will keep hitting you."
      end
    end
  end

  def player_sunk_check?
    if @player_ship_hits.length == 5
      true
    else
      false
    end
  end
  def computer_sunk_check?
    if @computer_ship_hits.length == 5
      true
    else
      false
    end
  end

  def end_game_check?
    if player_sunk_check?
      return true
    elsif computer_sunk_check?
      return true
    else
      return false
    end
  end
  def end_game
    if player_sunk_check?
      puts "I won. Easily."
    elsif computer_sunk_check?
      puts "You won!"
    end
  end
end
