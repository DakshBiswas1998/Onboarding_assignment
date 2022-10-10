class DiceSet
  attr_reader :total_dice
  attr_reader :scoring_dice
  attr_reader :non_scoring_dice
  attr_reader :points
  attr_reader :results

  def initialize(num_dice)
    @total_dice = num_dice
  end

  def roll
    @scoring_dice = 0
    @non_scoring_dice = 0
    @points = 0
    @results = []

    # Get random results
    @total_dice.times { @results << rand(1..6) }

    # Calculate score
    1.upto(6) do |num|
      qty = @results.count(num)

      # Score any of the triples
      if qty >= 3
        @points += num == 1 ? 1000 : num * 100
        @scoring_dice += 3
        qty -= 3
      end

      # Score single 1's
      if num == 1
        @points += qty * 100
        @scoring_dice += qty
      end

      # Score single 5's
      if num == 5
        @points += qty * 50
        @scoring_dice += qty
      end
    end

    @non_scoring_dice = @total_dice - @scoring_dice

    @results
  end

  def no_scoring_dice?
    @scoring_dice == 0
  end

  def all_scoring_dice?
    @scoring_dice == @total_dice
  end
end
