require './client'

min_sleep_seconds = 10
max_sleep_seconds = 20
max_clients_count = 3
max_requests_per_client = 5

Client.hostname = ARGV[0]
while true
  rand(0...max_clients_count).times do |client|
    rand(0...max_requests_per_client).times do |client_request|
      if [true, false].sample
        puts "Ordering a pizza"
        Client.generate_pizza_request
      else
        puts "Ordering a generic product"
        Client.generate_generic_request
      end
    end
  end
  sleep rand(min_sleep_seconds..max_sleep_seconds)
end
