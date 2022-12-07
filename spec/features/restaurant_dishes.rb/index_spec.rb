require 'rails_helper'
RSpec.describe 'RestaurantDish index' do
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9)
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1)

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 2, restaurant_id: @restaurant2.id)
  end
  describe 'index' do
    it 'has a link to the index on the restaurant show page' do
      visit "/restaurants/#{@restaurant1.id}"
      expect(page).to have_link('Dishes by this restaurant')
      click_on 'Dishes by this restaurant'
      expect(page).to have_content('Dishes from this Restaurant')
      expect(page).to_not have_content(@dish4.name)
    end
  end
  describe 'new dish' do
    it 'has a link to add a new dish' do
      visit "/restaurants/#{@restaurant1.id}/restaurant_dishes"
      click_on "Add Dish"
      fill_in :name, with: "Potatos and Gravy"
      fill_in :available, with: "true"
      fill_in :price, with: "5"
      click_on "Submit"
      expect(page).to have_content("Potatos and Gravy")
      expect(page).to have_content("5")

    end
  end
  describe 'edit dish' do
    it 'has a link to edit dish' do
      visit "/restaurants/#{@restaurant1.id}/restaurant_dishes"
      click_on "Edit Dish #{@dish1.id}" 
      fill_in :name, with: "Pickles"
      fill_in :available, with: "true"
      fill_in :price, with: "2"
      click_on "Update"
      save_and_open_page
      expect(page).to have_content("Pickles")
      expect(page).to have_content("2")
    end
  end
  describe 'true only' do
    it 'only shows true children' do
      dish5 = Dish.create!(name: "False Burger", available: false, price: 100, restaurant_id: @restaurant1.id)
      visit "/restaurants/#{@restaurant1.id}/restaurant_dishes"
      expect(page).to_not have_content("False Burger")
      expect(page).to_not have_content("100")

      save_and_open_page
    end
  end
end
