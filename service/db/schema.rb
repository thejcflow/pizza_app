# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200303154655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lasagnas", force: :cascade do |t|
    t.boolean "deliver"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "pizza_type"
    t.string "cheese"
    t.string "sauce"
    t.string "crust"
    t.string "size"
    t.integer "slices"
    t.string "ingredients", default: [], array: true
    t.string "toppings", default: [], array: true
    t.boolean "deliver"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredients"], name: "index_pizzas_on_ingredients", using: :gin
    t.index ["toppings"], name: "index_pizzas_on_toppings", using: :gin
  end

  create_table "salads", force: :cascade do |t|
    t.boolean "deliver"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaghettis", force: :cascade do |t|
    t.boolean "deliver"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
