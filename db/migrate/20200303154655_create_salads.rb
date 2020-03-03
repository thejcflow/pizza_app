class CreateSalads < ActiveRecord::Migration[5.1]
  def change
    create_table :salads do |t|
      t.boolean :deliver
      t.string :state
      t.timestamps
    end
  end
end
