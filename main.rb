require_relative 'player'
require_relative 'Display'
require_relative 'DiceSet'

class Game
  DICE_TO_USE     = 5
  IN_GAME_POINTS  = 300
  END_GAME_POINTS = 1000

  def initialize
    @players = []
    @round = 1
    @last_round = false

    start_game
  end

  def start_game
    Display.prompt_for_player_names.each do |name|
      @players << Player.new(name)
    end

    # Play normal rounds until a player accumulates END_GAME_POINTS
    # That player is now the one to beat.
    until @last_round
      Display.display_round_number(@round)

      @players.each do |player|
        player.take_turn

        if player.finished
          @last_round = true
          break
        end
      end

      @round += 1
    end

    # Play last round. Give every other player one turn to try and
    # beat the high score
    if @last_round
      Display.display_last_round

      @players.each do |player|
        player.take_turn unless player.finished
      end
    end

    Display.display_final_scores(@players)
  end
end

# Play Game
Game.new
