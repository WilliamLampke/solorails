require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'relationships' do
    it {should belong_to :restaurant }
    it {should have_many(:restaurant_dishes) }
  end
end
