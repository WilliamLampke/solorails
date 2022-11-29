class Restaurant < ApplicationRecord
  has_many :dishes  
  has_many :restaurant_dishes
  has_many :dishes, through: :restaurant_dishes
  def self.sortbytime
    order(:created_at)
  end
end
