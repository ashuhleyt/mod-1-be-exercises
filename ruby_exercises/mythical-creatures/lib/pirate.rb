class Pirate 
  attr_reader :name,
              :job, 
              :cursed, 
              :booty

  def initialize(name, job = 'Scallywag')
    @name = name
    @job = job
    @heinous_acts_count = 0
    @cursed = false
    @booty = 0
  end

  def cursed?
    @cursed
  end

  def commit_heinous_act
    @heinous_acts_count += 1
    @cursed = true if @heinous_acts_count >= 3
  end

  def rob_ship 
    @booty += 100
  end
end