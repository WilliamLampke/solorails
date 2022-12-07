require 'rails_helper'

RSpec.describe 'Restaurant show' do 
  before :each do
    @restaurant1 = Restaurant.create!(name: 'bobs', open: true, rating: 9)
    @restaurant2 = Restaurant.create!(name: 'krustys', open: true, rating: 1)

    @dish1 = Dish.create!(name: 'mcdouble', available: true, price: 5, restaurant_id: @restaurant1.id)
    @dish2 = Dish.create!(name: 'deluxe', available: true, price: 20, restaurant_id: @restaurant1.id)
    @dish3 = Dish.create!(name: 'mcrib', available: false, price: 4, restaurant_id: @restaurant1.id)

    @dish4 = Dish.create!(name: 'krusty burger', available: true, price: 13, restaurant_id: @restaurant2.id)

  end
  describe 'show' do
    it 'shows all elements of a restaurant on its show page' do
        visit "/restaurants/#{@restaurant1.id}"
        expect(page).to have_content(@restaurant1.id)
        expect(page).to have_content(@restaurant1.name)
        expect(page).to have_content(@restaurant1.open)
        expect(page).to have_content(@restaurant1.rating)
        expect(page).to_not have_content(@restaurant2.id)

    end
    it 'shows all dishes that belong to a restaurant' do
    visit "/restaurants/#{@restaurant1.id}/restaurant_dishes"
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.available)
    expect(page).to have_content(@dish1.price)
    expect(page).to have_content(@dish1.restaurant_id)

    expect(page).to have_content(@dish2.name)
    expect(page).to have_content(@dish2.available)
    expect(page).to have_content(@dish2.price)
    expect(page).to have_content(@dish2.restaurant_id)

    expect(page).to have_content(@dish3.name)
    expect(page).to have_content(@dish3.available)
    expect(page).to have_content(@dish3.price)
    expect(page).to have_content(@dish3.restaurant_id)

    expect(page).to_not have_content(@dish4.name)
    expect(page).to_not have_content(@dish4.price)
    expect(page).to_not have_content(@dish4.restaurant_id)
    end
    it 'shows count of dishes belonging to it' do
      visit "/restaurants/#{@restaurant1.id}"
      expect(page).to have_content('Dish Count: 3')
    end
    it 'has a edit function on the edit page' do
      visit "/restaurants/#{@restaurant1.id}"
      expect(page).to have_content('bobs')
      click_on "Update Restaurant"
      fill_in :name, with: "lennys"
      fill_in :open, with: "true"
      fill_in :rating, with: "10"

      click_on "Update"
      expect(page).to have_content('lennys')
      expect(page).to have_content('true')
      expect(page).to have_content('10')


      
    end
  end
end