class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient_obj, amount)
    if @ingredients_required.keys.include?(ingredient_obj)
      @ingredients_required[ingredient_obj] += amount
    else
      @ingredients_required[ingredient_obj] = amount
    end
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.map do |ingredient|
      ingredient[0].calories * ingredient[1]
    end.sum
  end
end
