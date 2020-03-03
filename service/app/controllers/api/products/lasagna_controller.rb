class Api::Products::LasagnaController < Api::Products::OrderController
  ## Mocked wait time for updating orders.
  @@wait_time = 35

  def index
    super(Lasagna)
  end

  def show
    super(Lasagna)
  end

  def create
    super(Lasagna, lasagna_params, @@wait_time)
  end

  private
  def lasagna_params
    params.permit(:deliver, :state)
  end
end
