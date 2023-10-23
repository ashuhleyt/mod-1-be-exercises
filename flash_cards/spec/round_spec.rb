require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do 
  before(:each) do 
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs 
      and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]   
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@round).to be_a(Round)
    end
  end

  describe '#turns' do 
    it 'will show which card in the array of cards is the current turn' do 
      expect(@round.turns).to eq([])
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe '#take_turn' do 
    it 'will take a turn from the array of cards in the deck' do 
      new_turn = @round.take_turn("Juneau")
      
      
      # expect(new_turn.class).to be_a(Turn) this passes in pry...
      expect(new_turn.correct?).to be(true)
      expect(@round.turns).to eq([new_turn])
      expect(@round.number_correct).to eq(1)
      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
      new_turn_2 = @round.take_turn("North north west")
      expect(@round.percent_correct).to eq(50.0)
      expect(@round.percent_correct_by_category(:Geography)).to eq(50.0)
    end
  end
end