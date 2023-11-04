class Artist
  attr_reader :id, :name, :born, :died, :country

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @born = attributes[:born]
    @died = attributes[:died]
    @country = attributes[:country]
  end

  def age_at_death
    birth_year = @born.to_i
    death_year = @died.to_i
    death_year - birth_year
  end
end