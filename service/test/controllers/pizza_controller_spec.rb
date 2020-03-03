require 'test_helper'

class PizzaControllerTest < ActionDispatch::IntegrationTest
  fixtures :pizzas

  setup do
    @pizza = pizzas(:test)
  end

  test "should get index" do
    get "/api/products/pizzas", as: :json, headers: { 'Content-Type' => 'application/json' }
    assert_response :success
  end

  test "should create pizza" do
    assert_difference('Pizza.count') do
      post "/api/products/pizzas", params: {
          :pizza_type => "hawaiian",
          :cheese => "mozzarella",
          :sauce => "bechamel",
          :crust => "thin",
          :size => "personal"
      }, as: :json
    end

    assert_response 201
  end

  test "should not create pizza" do
    post "/api/products/pizzas", params: {
        :pizza_type => "hawaiian",
        :cheese => "mozzarella",
        :sauce => "bechamel",
        :crust => "thin"
    }, as: :json
    assert_response 400
  end

  test "should show pizza" do
    get "/api/products/pizzas/#{@pizza.id}", as: :json
    assert_response 200
  end

  test "should not show pizza" do
    get "/api/products/pizzas/-1", as: :json
    assert_response 404
  end
end
