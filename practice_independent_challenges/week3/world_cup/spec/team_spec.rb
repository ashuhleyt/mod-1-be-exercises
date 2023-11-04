require './lib/player'
require './lib/team'

RSpec.describe Team do
  before(:each) do
    @team1 = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  describe '#initialize' do
    it 'exists' do 
      expect(@team1).to be_a(Team)
      expect(@team1.country).to eq("France")
    end 
  end

  describe '#eliminated?' do
    it 'returns false' do
      expect(@team1.eliminated?).to eq(false)
      @team1.eliminated
      expect(@team1.eliminated?).to eq(true)
    end
  end

  describe '#players' do
    it 'returns an empty array' do
      expect(@team1.players).to eq([])
    end

    it 'can add players to a team' do 
      @team1.add_player(@mbappe)
      @team1.add_player(@pogba)
      expect(@team1.players).to eq([@mbappe, @pogba])
    end

    it 'can return an array of players by position' do
      @team1.add_player(@mbappe)
      @team1.add_player(@pogba)
      expect(@team1.players_by_position("midfielder")).to eq([@pogba])
      expect(@team1.players_by_position("forward")).to eq([@mbappe])
      expect(@team1.players_by_position("defender")).to eq([])
    end
  end
end