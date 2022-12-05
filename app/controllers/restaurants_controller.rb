class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.sortbytime
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def new
  end
  def create 
    Restaurant.create!(name: params["name"], open: params["open"], rating: params["rating"])
    redirect_to "/restaurants"
  end
end
