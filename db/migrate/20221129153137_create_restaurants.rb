class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.boolean :open
      t.integer :rating
      t.timestamps
    end
  end
end
