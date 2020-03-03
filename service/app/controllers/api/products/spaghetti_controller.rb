class Api::Products::SpaghettiController < Api::Products::OrderController
  ## Mocked wait time for updating orders.
  @@wait_time = 10

  def index
    super(Spaghetti)
  end

  def show
    super(Spaghetti, params)
  end

  def create
    super(Spaghetti, spaghetti_params, @@wait_time)
  end

  private
  def spaghetti_params
    params.permit(:deliver, :state)
  end
end
