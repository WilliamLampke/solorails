class CreateRestaurantDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_dishes do |t|
      t.bigint :restaurant_id
      t.bigint :dish_id
    end
  end
end
