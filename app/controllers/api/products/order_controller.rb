class Api::Products::OrderController < ApplicationController
  def index(classs)
    render(json: classs.all)
  end

  def show(classs)
    selected_order = classs.find(params[:id])
    if selected_order.nil?
      render(json: {error: "#{classs.name} order not found."}, status: 404)
    else
      render(json: selected_order, status: 200)
    end
  end

  def create(classs, params, wait_time)
    order = classs.new(params)
    if order.save
      render(json: order, status: 200)
    else
      render(json: { errors: order.errors }, status: 400)
    end
  end
end
