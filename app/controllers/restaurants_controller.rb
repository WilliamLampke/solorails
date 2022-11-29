class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.sortbytime
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
