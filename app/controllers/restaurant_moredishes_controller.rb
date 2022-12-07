class RestaurantMoredishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dishes = Dish.same_id(params[:restaurant_id]).alphabetical
  end
end
