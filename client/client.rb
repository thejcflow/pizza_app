require 'faraday'
require 'json'
require './pizza_query_generator'
require './generic_query_generator'

class Client
  @@base_url = "/api/products"

  def self.hostname=(hostname)
    @@hostname = hostname
  end

  def self.generate_pizza_request
    url = "#{@@hostname + @@base_url}/pizzas"
    body = PizzaQueryGenerator.generate_post_body
    headers = {"Content-Type" => "application/json"}
    Faraday.post(url, body, headers)
  end

  def self.generate_generic_request
    url = "#{@@hostname + @@base_url}#{["/spaghetti", "/lasagna", "/salads"].sample}"
    body = GenericQueryGenerator.generate_post_body
    headers = {"Content-Type" => "application/json"}
    Faraday.post(url, body, headers)
  end
end
