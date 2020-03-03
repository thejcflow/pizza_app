class Api::Products::SaladsController < Api::Products::OrderController
  ## Mocked wait time for updating orders.
  @@wait_time = 7

  def index
    super(Salad)
  end

  def show
    super(Salad)
  end

  def create
    super(Salad, salad_params, @@wait_time)
  end

  private
  def salad_params
    params.permit(:deliver, :state)
  end
end
