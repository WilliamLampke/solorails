require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'relationships' do
    it {should belong_to :restaurant }
  end
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9)
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1)

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 13, restaurant_id: @restaurant2.id)

  end
  describe 'same_id' do
    it 'has all dishes with the same id' do
      expect(Dish.same_id(@restaurant1.id)).to eq([@dish1, @dish2, @dish3])
    end
  end
  describe 'available_yes' do
    it 'shows only true dishes' do
      dish5 = Dish.create!(name: "False Burger", available: false, price: 100, restaurant_id: @restaurant1.id)
      expect(Dish.available_yes).to eq([@dish1, @dish2, @dish4])
      
    end
  end
  describe 'alphabetical' do
    it 'sorts alphabetically' do
      expect(Dish.alphabetical).to eq([@dish2, @dish4, @dish1, @dish3])
    end
  end

end
