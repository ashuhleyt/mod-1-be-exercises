class Wizard 
  attr_reader :name, 
              :bearded, 
              :rested

  def initialize(name, options = {})
    @name = name
    @bearded = options.fetch(:bearded, true)
    @cast_spell_count = 0
    @rested = true
  end

  def bearded?
    @bearded
  end

  def incantation(spell)
    "sudo #{spell}"
  end

  def rested?
    @cast_spell_count < 3
  end

  def cast
    @cast_spell_count += 1
    "MAGIC MISSILE!"
  end 
end