class Round 
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)

    @turns << new_turn
    new_turn
  end

  def number_correct
    count = 0
    @turns.each do |turn|
      count += 1 if turn.correct?
    end
    count
  end

  def number_correct_by_category(category)
    count = 0 
    @turns.each do |turn|
      count += 1 if turn.correct? && turn.card.category == category
    end
    count
  end

  def percent_correct
    total_turns = @turns.length

    correct_turns = @turns.count(&:correct?)
    (correct_turns.to_f / total_turns ) * 100
  end

  def percent_correct_by_category(category)
    total_turns = @turns.count

    correct_turns = @turns.count { |turn| turn.correct? && turn.card.category == category }
    percentage = (correct_turns.to_f / total_turns) * 100
    percentage.round(1)
  end
end