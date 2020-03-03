class Api::Products::PizzasController < Api::Products::OrderController
  ## Mocked wait time for updating orders.
  @@wait_time = 15

  def index
    super(Pizza)
  end

  def show
    super(Pizza)
  end

  def create
    super(Pizza, pizza_params, @@wait_time)
  end

  private
  def pizza_params
    params.require(:pizza).permit(:pizza_type, :cheese, :sauce, :crust, :size, :slices, :deliver, ingredients: [], toppings: [])
  end
end
