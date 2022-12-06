require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'relationships' do
    it { should have_many(:dishes) }
  end
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9, created_at: 'Tue, 28 Nov 2022 18:04:58 UTC +00:00')
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1, created_at: 'Tue, 27 Nov 2022 18:04:58 UTC +00:00')

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 2, restaurant_id: @restaurant2.id)

  end

  describe 'sort' do
    it 'sorts by creation date' do
      expect(Restaurant.sortbytime).to eq([@restaurant2, @restaurant1])
    end
  end
end
