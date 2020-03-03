class CreateSpaghetti < ActiveRecord::Migration[5.1]
  def change
    create_table :spaghettis do |t|
      t.boolean :deliver
      t.string :state
      t.timestamps
    end
  end
end
