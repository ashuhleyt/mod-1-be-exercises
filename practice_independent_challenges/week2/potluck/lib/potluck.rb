class Potluck 
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(type)
    @dishes.find_all do |dish|
      dish.category == type
    end
  end

  def menu 
    menu_hash = Hash.new
    
    @dishes.each do |dish|
      if menu_hash.key?(dish.category)
        menu_hash[dish.category] << dish.name
      else 
        menu_hash[dish.category] = [dish.name]
      end
    end
    menu_hash
  end
end