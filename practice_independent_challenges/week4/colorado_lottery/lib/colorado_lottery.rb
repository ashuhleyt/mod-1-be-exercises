class ColoradoLottery
  attr_reader :registered_contestants,
              :winners, 
              :games

  def initialize(games)
    @registered_contestants = Hash.new(0)
    @winners = []
    @games = games 
  end

  def current_contestants
    @registered_contestants
  end

  def interested_and_18?(contestant, game)
    if contestant.age >= 18 && contestant.game_interests.include?(game)
      true
    else 
      false
    end
  end

  def can_register?(contestant, game)
    age_eligible = contestant.age >= 18
    interest_eligible = contestant.game_interests.include?(game)
    spending_money_eligible = contestant.spending_money >= game.cost
    age_eligible && interest_eligible && spending_money_eligible
  end

  def register_contestant(contestant, game) 
    if can_register?(contestant, game)
      contestant.spending_money -= game.cost
    end

    if current_contestants.key?(game.name)
      current_contestants[game.name] << contestant.full_name
    else 
      current_contestants[game.name] = [contestant.full_name]
    end
  end

  def draw_winners 
    @winners = []

    @games.each do |game|
      eligible_contestants = current_contestants[game.name]
      if eligible_contestants && !eligible_contestants.empty?
        winner = eligible_contestants.sample
        @winners << { winner => game.name }
      else 
        @winners << { "No Eligible Contestants" => game.name }
      end
    end
  end
end