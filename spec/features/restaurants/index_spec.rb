require 'rails_helper'

RSpec.describe 'Restaurant Index' do
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9, created_at: 'Tue, 28 Nov 2022 18:04:58 UTC +00:00')
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1, created_at: 'Tue, 27 Nov 2022 18:04:58 UTC +00:00')

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 2, restaurant_id: @restaurant2.id)
    
  end
  describe 'page elements' do
    it 'has the name of each restaurant' do
      visit '/restaurants'

      expect(page).to have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant2.name)
    end
    it 'orders restaurants by creation date' do
      visit '/restaurants'
      expect(@restaurant2.name).to appear_before(@restaurant1.name)
      expect(page).to have_content('2022-11-27 18:04:58 UTC')
      expect(page).to have_content('2022-11-28 18:04:58 UTC')
    end
    it 'has a link to make a new restaurant' do
      visit '/restaurants'
      click_on "New Restaurant"
      expect(page).to have_content('Name:')
      expect(page).to have_content('Open:')
      expect(page).to have_content('Rating:')
      
      fill_in :name, with: "Billys"
      fill_in :open, with: "true"
      fill_in :rating, with: "10"
      click_on "Submit"
      save_and_open_page
      expect(page).to have_content("Billys")
    end
  end
end
