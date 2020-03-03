# Pizza REST API Service + Client

Basic REST API using Ruby 2.3.3 and  Ruby on Rails 5.1.7.
Basic Client script using Ruby 2.3.3.

## REST Service

### Features
  - Database mocked using JSON files located at `${pizza_shop/db/api/products/pizza}` .  These files are Pizza's type, cheese, sauce, crust and size. These files could be updated anytime or updated "daily" as AC says.
  - The ingredients and toppings properties are optional. They are arrays of strings.
  - Spaghetti, lasagna and salads are considered client orders too.
  - The client orders are stored on a postgres DB.
  - The state of the order are "baking", "cooking" and "heating". Also it could be "delivering" and "delivered" if the `deliver` flag is `true`.
  - A order job automatically updates the order state based every x seconds. This time is located in every specific controller.

### Routes

| Verb | URI Pattern |
| ------ | ------ |
| GET | /api/products/pizzas |
| POST | /api/products/pizzas |
| GET | /api/products/pizzas/:id |
| GET | /api/products/spaghetti |
| POST | /api/products/spaghetti |
| GET | /api/products/spaghetti/:id |
| GET | /api/products/lasagna |
| POST | /api/products/lasagna |
| GET | /api/products/lasagna/:id |
| GET | /api/products/salads |
| POST | /api/products/salads |
| GET | /api/products/salads/:id |

#### Pizza object

| Property | Type | Required | Values |
| ------ | ------ | ------ | ------ |
| type | string | YES | "hawaiian", "brazilian", "veggie" | 
| cheese | string | YES | "mozzarella", "cheddar", "parmesan" | 
| sauce | string | YES | "bechamel", "veloute", "espagnole", "hollandaise" | 
| crust | string | YES | "thin", "thick", "filled" | 
| size | string | YES | "personal", "small", "medium", "large" | 
| slices | integer | NO | "personal" -> 4, "small" -> 6, "medium" -> 8, "large" -> 10 | 
| ingredients | array<string> | NO | - | 
| toppings | array<string> | NO | - | 
| deliver | boolean | NO | - | 

### Run service

```sh
cd service/
build install
rails server -b 127.0.0.1 -p 3000 -e development
```

### Run service unit tests

```sh
cd service/
rake test
```

### Important

The most important changed files are:
  - Controllers: `service/app/controllers/api/products/` - All orders extend OrderController
  - Models: `service/app/models/` - All orders extend Order
  - Routes: `service/config/routes.rb` - Routes file
  - Tests: `service/test/` - Models and controllers unit tests
  - Jobs: `service/app/jobs/` - Order status updater job
  - DB: `service/db/migrate/` - Rake migrate files

## REST Client

### Features
  - Every 10 to 20 seconds the program will send client requests.
  - Every time 1 to 3 clients will place orders.
  - Each client will order 1 to 5 different products.

### Run client

```sh
cd client/
ruby main.rb http://localhost:3000
```

## Todos

 - Order status job execution on server could be improved.
 - External order status enum

License
----

MIT
