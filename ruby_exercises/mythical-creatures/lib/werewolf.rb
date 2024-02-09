class Werewolf 
  attr_reader :name, :location, :human, :wolf

  def initialize(name, location = 'London')
    @name = name
    @location = location
    @human = true
    @wolf = false
  end

  def human?
    @human
  end

  def wolf? 
    @wolf 
  end
  
  def change!
    @human = false
    @wolf = true
  end
end