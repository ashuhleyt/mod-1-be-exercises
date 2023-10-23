class Venue 
  attr_reader :name, :capacity, :patrons

  def initialize(name, capacity)
    @name = name
    @capacity = capacity  
    @patrons = []
  end

  def add_patron(patron)
    @patrons << patron
  end

  def yell_at_patrons
    @patrons.map do |patron|
      patron.upcase
    end
  end

  def over_capacity?
    @patrons.length > @capacity
  end

  def kick_out
    @patrons.shift
  end
end