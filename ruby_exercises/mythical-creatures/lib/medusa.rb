class Medusa
  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    if @statues.length >= 3
      removed_victim = @statues.shift
      removed_victim.unstone
    end

    victim.stared_at = true
    @statues << victim
  end
end
