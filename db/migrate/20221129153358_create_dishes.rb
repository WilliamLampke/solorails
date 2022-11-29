class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.boolean :available
      t.integer :price
      t.bigint :restaurant_id
      t.timestamps
    end
  end
end
