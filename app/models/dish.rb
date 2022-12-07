class Dish < ApplicationRecord
    belongs_to :restaurant
    def self.same_id(id)
        where(restaurant_id: id)
    end
    def self.available_yes
        where(available: true)
    end
    def self.alphabetical
        order(:name)
    end
end