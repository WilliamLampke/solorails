require 'rails_helper'

RSpec.describe 'Restaurant show' do 
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9)
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1)

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 2, restaurant_id: @restaurant2.id)
  end
  describe 'show' do
    it 'shows all elements of a restaurant on its show page' do
        visit "/restaurants/#{@restaurant1.id}"
        save_and_open_page
        expect(page).to have_content(@restaurant1.id)
        expect(page).to have_content(@restaurant1.name)
        expect(page).to have_content(@restaurant1.open)
        expect(page).to have_content(@restaurant1.rating)
        expect(page).to_not have_content(@restaurant2.id)

    end
  end
end