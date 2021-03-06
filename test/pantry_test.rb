require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"


class PantryTest < Minitest::Test
  def test_it_exists_and_has_attribute
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
    assert_equal ({}), pantry.stock
  end

  def test_it_can_stock_ingredients
    pantry = Pantry.new
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    assert_equal 0, pantry.stock_check(ingredient1)
    pantry.restock(ingredient1, 5)
    assert_equal 5, pantry.stock_check(ingredient1)
    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)
    pantry.restock(ingredient2, 7)
    assert_equal 7, pantry.stock_check(ingredient2)
  end

  def test_it_has_enough_ingredients
    pantry = Pantry.new
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    assert_equal false,
  end

end
