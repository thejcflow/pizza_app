class CreatePizzas < ActiveRecord::Migration[5.1]
  def change
    create_table :pizzas do |t|
      t.string :pizza_type
      t.string :cheese
      t.string :sauce
      t.string :crust
      t.string :size
      t.integer :slices
      t.string :ingredients, array: true, default: []
      t.string :toppings, array: true, default: []
      t.boolean :deliver
      t.string :state
      t.timestamps
    end
    add_index :pizzas, :ingredients, using: 'gin'
    add_index :pizzas, :toppings, using: 'gin'
  end
end
