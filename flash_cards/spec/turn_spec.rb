require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@turn).to be_instance_of(Turn)
      expect(@turn.card).to eq(@card)
      expect(@turn.guess).to eq("Juneau")
      expect(@turn.correct?).to be(true)
      expect(@turn.feedback).to eq("Correct!")
    end
  end

  describe '#wrong_guess' do 
    it 'ensures feedback is correct for a wrong guess' do 
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      wg_turn = Turn.new("Saturn", @card)
      expect(wg_turn.guess).to eq("Saturn")
      expect(wg_turn.correct?).to be(false)
      expect(wg_turn.feedback).to eq("Try again idiot.")
    end
  end
end