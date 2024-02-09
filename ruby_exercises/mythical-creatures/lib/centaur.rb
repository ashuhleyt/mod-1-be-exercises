class Centaur 
  attr_reader :name, 
              :breed, 
              :cranky, 
              :standing

  def initialize(name, breed)
    @name = name 
    @breed = breed
    @cranky = false
    @standing = true
  end

  def shoot 
    'Twang!!!'
  end

  def run 
    'Clop clop clop clop!'
  end

  def cranky?
    @cranky
  end

  def standing? 
    @standing
  end
end