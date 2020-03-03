class PizzaQueryGenerator
  # Pizza values
  @@pizza_types = ["hawaiian", "brazilian", "veggie"]
  @@pizza_cheeses = ["mozzarella", "cheddar", "parmesan"]
  @@pizza_sauces = ["bechamel", "veloute", "espagnole", "hollandaise"]
  @@pizza_crusts = ["thin", "thick", "filled"]
  @@pizza_sizes = ["personal", "small", "medium", "large"]
  @@pizza_ingredients = [[], ["coca-cola", "popcorn"], ["fanta", "french fries"], ["pepsi", "chicken", "water"]]
  @@pizza_toppings = [[], ["tomato", "corn"], ["ketchup"], ["pineapple", "olive", "cucumber"]]

  def self.generate_post_body
    # Required pizza properties
    pizza_order = {
        :pizza_type => @@pizza_types.sample,
        :cheese => @@pizza_cheeses.sample,
        :sauce => @@pizza_sauces.sample,
        :crust => @@pizza_crusts.sample,
        :size => @@pizza_sizes.sample
    }

    # Optional pizza slices
    if [true, false].sample
      pizza_order[:slices] = rand(1..20)
    end

    # Optional pizza ingredients
    if [true, false].sample
      pizza_order[:ingredients] = @@pizza_ingredients.sample
    end

    # Optional pizza toppings
    if [true, false].sample
      pizza_order[:toppings] = @@pizza_toppings.sample
    end

    # Optional pizza delivery
    if [true, false].sample
      pizza_order[:deliver] = [true, false].sample
    end

    pizza_order.to_json
  end
end
