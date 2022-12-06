class Restaurant < ApplicationRecord
  has_many :dishes  
  def self.sortbytime
    order(:created_at)
  end
end
