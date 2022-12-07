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
      fill_in(:name, with: "Pickles")
      fill_in(:available, with: "true")
      fill_in(:price, with: "2")
      click_on "Update"
      expect(page).to have_content("Pickles")
      expect(page).to have_content("2")
    end
  end
  describe 'alphabetical' do
    it 'adds a link to sort in aplhabetical order by name' do
      visit "/restaurants/#{@restaurant1.id}/restaurant_dishes"
      click_on "Sort Alphabetically"
      expect(@dish2.name).to appear_before(@dish1.name)
      expect(@dish1.name).to appear_before(@dish3.name)
    end
  end
  describe 'sort by number' do
    it 'has a form to sort by number' do 
      visit "/restaurants/#{@restaurant1.id}/restaurant_dishes"
      fill_in :number, with: 6
      click_on "Submit"
      expect(page).to have_content('deluxe')
    end
  end
end
