require 'test_helper'

class PizzaTest < ActiveSupport::TestCase
  def test_no_arguments
    pizza = Pizza.new
    assert_not pizza.save
  end

  def test_with_valid_arguments
    pizza = Pizza.new({
                          :pizza_type => "hawaiian",
                          :cheese => "mozzarella",
                          :sauce => "bechamel",
                          :crust => "thin",
                          :size => "personal"
                      })
    assert pizza.save
  end

  def test_with_all_arguments
      pizza = Pizza.new({
                            :pizza_type => "hawaiian",
                            :cheese => "mozzarella",
                            :sauce => "bechamel",
                            :crust => "thin",
                            :size => "personal",
                            :slices => 10,
                            :ingredients => ["tomato", "corn"],
                            :toppings => ["coca-cola", "popcorn"],
                            :deliver => true
                        })
      assert pizza.save
  end
end
