class Dragon 
  attr_reader :name, 
              :color,  
              :rider
            
  def initialize(name, color, rider)
    @name = name 
    @rider = rider 
    @color = color
    @hungry = true
    @eat = 0
  end

  def hungry? 
    if @eat <= 2 
      true 
    else 
      false
    end
  end

  def eat 
    @eat += 1
  end
end