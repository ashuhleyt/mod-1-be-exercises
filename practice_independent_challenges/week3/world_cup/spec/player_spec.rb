require './lib/player'

RSpec.describe Player do
  before(:each) do
    @player1 = Player.new({name: "Luka Modric", 
      position: "midfielder"})    
  end

  describe '#initialize' do
    it 'exists' do
      expect(@player1).to be_a(Player)
      expect(@player1.name).to eq("Luka Modric")
      expect(@player1.position).to eq("midfielder")
    end
  end
end