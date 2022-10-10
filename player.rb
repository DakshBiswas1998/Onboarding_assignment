class Player
  attr_reader :name
  attr_reader :finished
  attr_reader :total_points

  def initialize(name)
    @name = name
    @in_the_game = false
    @finished = false
    @total_points = 0
  end

  def take_turn
    roll_points = 0
    turn_points = 0
    dice_remaining = Game::DICE_TO_USE

    Display.display_player_name(@name, @in_the_game)

    loop do
      # Roll dice
      dice = DiceSet.new(dice_remaining)
      dice.roll
      roll_points = dice.points
      turn_points += roll_points

      # Check results
      if dice.no_scoring_dice?
        Display.rolled_no_scoring_dice
        break
      elsif dice.all_scoring_dice?
        dice_remaining = Game::DICE_TO_USE
        answer = Display.rolled_all_scoring_dice(roll_points, turn_points, dice_remaining)
      else
        dice_remaining = dice.non_scoring_dice
        answer = Display.rolled_dice(roll_points, turn_points, dice_remaining)
      end

      next unless answer.downcase == 'n'

      unless @in_the_game
        if turn_points < Game::IN_GAME_POINTS
          turn_points = 0
        else
          @in_the_game = true
        end
      end

      @total_points += turn_points

      @finished = true if @total_points >= Game::END_GAME_POINTS

      Display.earned_points(turn_points, @total_points)
      break
    end
  end
end
