class Dish < ApplicationRecord
    belongs_to :restaurant
    has_many :restaurant_dishes
end