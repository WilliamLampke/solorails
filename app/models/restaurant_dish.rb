class RestaurantDish < ApplicationRecord
    belongs_to :dish 
    belongs_to :restaurant

    def self.same_id(id)
        where(restaurant_id: id)
    end
end