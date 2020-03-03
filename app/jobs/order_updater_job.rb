class OrderUpdaterJob < ApplicationJob
  def perform(classname, order_id)
    classs = nil
    case classname
    when Pizza.name
      classs = Pizza
    when Spaghetti.name
      classs = Spaghetti
    when Lasagna.name
      classs = Lasagna
    when Salad.name
      classs = Salad
    else
      # Nothing happens. Empty collection.
    end
    selected_order = classs.find(order_id)
    unless selected_order.nil?
      state = selected_order.state.nil? ? nil : selected_order.state.to_sym
      case state
      when :baking
        selected_order.state = :cooking
      when :cooking
        selected_order.state = :heating
      when :heating
        if selected_order.deliver
          selected_order.state = :delivering
        end
      when :delivering
        selected_order.state = :delivered
      else
        selected_order.state = :baking
      end
      selected_order.save
    end
  end
end