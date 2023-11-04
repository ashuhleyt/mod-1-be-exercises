require './lib/contestant'
require './lib/game.rb'
require './lib/colorado_lottery.rb'

RSpec.describe ColoradoLottery do 
  before :each do
    @games = [Game.new('Pick 4', 2), Game.new('Mega Millions', 5, true), Game.new('Cash 5', 1)]
    @lottery = ColoradoLottery.new(@games)
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({first_name: 'Alexander',
                                last_name: 'Aigiades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})
    @benjamin = Contestant.new({first_name: 'Benjamin',
                                last_name: 'Franklin',
                                age: 17,
                                state_of_residence: 'PA',
                                spending_money: 100})
    @frederick = Contestant.new({first_name:  'Frederick',
                                last_name: 'Douglass',
                                age: 55,
                                state_of_residence: 'NY',
                                spending_money: 20})
    @winston = Contestant.new({first_name: 'Winston',
                                last_name: 'Churchill',
                                age: 18,
                                state_of_residence: 'CO',
                                spending_money: 5})
  end

  it 'exists' do 
    expect(@lottery).to be_a(ColoradoLottery)
  end

  it 'starts with no contestants as an empty hash' do 
    expect(@lottery.registered_contestants).to eq({})
  end

  it 'starts with no winners as an empty array' do 
    expect(@lottery.winners).to eq([])
  end

  it 'does not currently have any contestants' do 
    expect(@lottery.current_contestants).to eq({})
  end

  it 'adds game interests for contestants' do 
    @alexander.add_game_interest(@pick_4)
    @alexander.add_game_interest(@mega_millions)
    @frederick.add_game_interest(@mega_millions)
    @winston.add_game_interest(@cash_5)
    @winston.add_game_interest(@mega_millions)
    @benjamin.add_game_interest(@mega_millions)
  
    expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq(true)
    expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq(false)
    expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
  end

  it 'states whether or not someone can register' do 
    @alexander.add_game_interest(@pick_4)
    @alexander.add_game_interest(@mega_millions)
    @frederick.add_game_interest(@mega_millions)
    @winston.add_game_interest(@cash_5)
    @winston.add_game_interest(@mega_millions)
    @benjamin.add_game_interest(@mega_millions)
    expect(@lottery.can_register?(@alexander, @pick_4)).to eq(true)
    expect(@lottery.can_register?(@alexander, @cash_5)).to eq(false)
    expect(@lottery.can_register?(@frederick, @mega_millions)).to eq(true)
    expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq(false)
    expect(@lottery.can_register?(@frederick, @cash_5)).to eq(false)
  end

  it 'registers eligible contestants for games' do
    @alexander.add_game_interest(@pick_4)
    @alexander.add_game_interest(@mega_millions)
    @frederick.add_game_interest(@mega_millions)
    @winston.add_game_interest(@cash_5)
    @winston.add_game_interest(@mega_millions)
    @benjamin.add_game_interest(@mega_millions)
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @lottery.register_contestant(@benjamin, @mega_millions)

 
    expect(@lottery.current_contestants).to eq({"Cash 5"=>["Winston Churchill"], 
      "Mega Millions"=>["Alexander Aigiades", "Frederick Douglass", "Winston Churchill", "Benjamin Franklin"], 
      "Pick 4"=>["Alexander Aigiades"]})
  end

  it 'does not register ineligible contestants for games' do
    # Register contestants for games
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @cash_5)

    expect(@lottery.current_contestants).to eq({"Cash 5"=>["Alexander Aigiades"], "Pick 4"=>["Alexander Aigiades"]})
  end

  it 'draws winners for each game' do 
    @alexander.add_game_interest(@pick_4)
    @alexander.add_game_interest(@mega_millions)
    @frederick.add_game_interest(@mega_millions)
    @winston.add_game_interest(@cash_5)
    @winston.add_game_interest(@mega_millions)
    @benjamin.add_game_interest(@mega_millions)
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    @lottery.register_contestant(@benjamin, @mega_millions)

    @lottery.draw_winners
    expect(@lottery.winners.length).to eq(@lottery.games.length)
  
    expected_winners = @lottery.games.map { |game| { "Random Winner" => game.name } }
    expect(@lottery.winners).to eq([{"Alexander Aigiades"=>"Pick 4"}, {"Winston Churchill"=>"Mega Millions"}, {"Winston Churchill"=>"Cash 5"}])
  end
end
