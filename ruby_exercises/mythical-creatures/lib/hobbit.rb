class Hobbit 
  attr_reader :name, 
              :disposition, 
              :age, 
              :short

  def initialize(name, disposition = 'homebody')
    @name = name
    @disposition = disposition
    @age = 0
    @short = true
  end

  def celebrate_birthday
    @age += 1
  end

  def adult? 
    if @age <= 32 
      false
    else 
      true
    end
  end

  def old? 
    if @age <= 100 
      false
    else 
      true
    end
  end

  def has_ring?
    if @name == 'Frodo'
      true 
    else 
      false
    end
  end

  def is_short?
    @short
  end
end