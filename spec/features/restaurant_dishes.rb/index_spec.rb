require 'rails_helper'
RSpec.describe 'RestaurantDish index' do
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9)
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1)

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 2, restaurant_id: @restaurant2.id)

    @rd1 = RestaurantDish.create!(restaurant_id: @restaurant1.id, dish_id: @dish1.id)
    @rd2 = RestaurantDish.create!(restaurant_id: @restaurant1.id, dish_id: @dish2.id)
    @rd3 = RestaurantDish.create!(restaurant_id: @restaurant1.id, dish_id: @dish3.id)

    @rd4 = RestaurantDish.create!(restaurant_id: @restaurant2.id, dish_id: @dish4.id)
  end
  describe 'index' do
    it 'has a link to the index on the restaurant show page' do 

        visit "/restaurants/#{@restaurant1.id}"
        expect(page).to have_link("Dishes by this restaurant")
        click_on "Dishes by this restaurant"
        expect(page).to have_content('Dishes from this Restaurant')
        expect(page).to_not have_content(@dish4.name)
    end
  end
end