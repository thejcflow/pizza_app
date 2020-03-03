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
      # Hard-coding jobs for updating order states.
      order_class_name = classs.name
      OrderUpdaterJob.set(wait: (wait_time*1).seconds).perform_later(order_class_name, order.id)
      OrderUpdaterJob.set(wait: (wait_time*2).seconds).perform_later(order_class_name, order.id)
      OrderUpdaterJob.set(wait: (wait_time*3).seconds).perform_later(order_class_name, order.id)
      OrderUpdaterJob.set(wait: (wait_time*4).seconds).perform_later(order_class_name, order.id)
      OrderUpdaterJob.set(wait: (wait_time*5).seconds).perform_later(order_class_name, order.id)

      render(json: order, status: 200)
    else
      render(json: { errors: order.errors }, status: 400)
    end
  end
end
