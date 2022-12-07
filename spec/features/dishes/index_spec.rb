require 'rails_helper'

RSpec.describe 'dishes index' do 
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9)
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1)

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 2, restaurant_id: @restaurant2.id)

  end
  describe 'index' do
    it 'shows all dishes and their attributes' do
      visit '/dishes'
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.available)
      expect(page).to have_content(@dish1.price)
      expect(page).to have_content(@dish1.restaurant_id)

      expect(page).to have_content(@dish2.name)
      expect(page).to have_content(@dish2.available)
      expect(page).to have_content(@dish2.price)
      expect(page).to have_content(@dish2.restaurant_id)

      expect(page).to have_content(@dish4.name)
      expect(page).to have_content(@dish4.available)
      expect(page).to have_content(@dish4.price)
      expect(page).to have_content(@dish4.restaurant_id)
    end
  end
  describe 'true only' do
    it 'only shows true children' do
      dish5 = Dish.create!(name: "False Burger", available: false, price: 100, restaurant_id: @restaurant1.id)
      visit "/dishes"
      expect(page).to_not have_content("False Burger")
      expect(page).to_not have_content("100")

      save_and_open_page
    end
  end
end