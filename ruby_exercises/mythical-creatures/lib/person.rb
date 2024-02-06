class Person
  attr_reader :name
  attr_accessor :stared_at

  def initialize(name)
    @name = name
    @stared_at = false
  end

  def stoned?
    @stared_at
  end

  def unstone
    @stared_at = false
  end
end