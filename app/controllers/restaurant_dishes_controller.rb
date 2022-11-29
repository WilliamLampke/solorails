class RestaurantDishesController < ApplicationController
    def index 
        @restaurant_dishes = RestaurantDish.same_id(params[:restaurant_id])
    end
end