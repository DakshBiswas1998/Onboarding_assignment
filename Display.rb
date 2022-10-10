class Display
  def self.prompt_for_player_names
    puts 'Enter player names seperated by a comma '
    gets.chomp.strip.split(/\s*,\s*/)
  end

  def self.display_round_number(round_number)
    puts
    puts "=== Round #{round_number} =========================================================="
  end

  def self.display_last_round
    puts
    puts '=== FINAL Round ======================================================='
  end

  def self.display_player_name(player_name, in_the_game)
    puts
    puts "> #{player_name}'s turn"
    unless in_the_game
      puts "(You must roll atleast #{Game::IN_GAME_POINTS} " +
           'points in one turn to enter the game)'
    end
  end

  def self.rolled_no_scoring_dice
    puts
    puts 'You rolled ' + 'no scoring dice' + ', your turn is over.'
  end

  def self.rolled_all_scoring_dice(roll_points, turn_points, dice_remaining)
    puts
    puts "You rolled #{roll_points} points giving you " +
         "a total of #{turn_points} points for this turn. "
    puts 'And you rolled all scoring dice so you ' +
         "get to roll all #{dice_remaining} dice again."
    print 'Do you wish to roll again? ' + '[y/n] '
    gets.chomp
  end

  def self.rolled_dice(roll_points, turn_points, dice_remaining)
    puts
    puts "You rolled  #{roll_points} points giving you " +
         "a total of #{turn_points} points for this turn."
    print "You have #{dice_remaining} dice remaining. " +
          'Do you wish to roll again?  [y/n] '
    gets.chomp
  end

  def self.earned_points(turn_points, total_points)
    puts
    puts "You earned #{turn_points} points this turn " +
         "giving you a total of #{total_points} points"
  end

  def self.display_final_scores(players)
    puts
    puts '=== Final Scores ====================================================='
    puts
    players.each do |player|
      puts " #{player.name}'s Final score is #{player.total_points}"
    end
    puts
  end
end
