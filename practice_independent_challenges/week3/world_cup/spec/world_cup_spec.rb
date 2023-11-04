require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
  before(:each) do
    @france = Team.new("France")
    @team1 = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @world_cup = WorldCup.new(2018, [@france, @croatia])
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@world_cup).to be_a(WorldCup)
    end
  end

  describe '#attributes' do 
    it 'has attributes' do
      expect(@world_cup.year).to eq(2018)
      expect(@world_cup.teams).to eq([@france, @croatia])
    end
  end

  describe '#active_players_by_position' do
    it 'can return an array of players by position' do
      expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
    end
  end

  describe '#all_players_by_position' do
    it 'can return an array of players by position' do
      expect(@world_cup.all_players_by_position).to eq({
    "forward" => [@mbappe],
    "midfielder" => [@pogba, @modric],
    "defender" => [@vida]
  }
)
    end
  end
end