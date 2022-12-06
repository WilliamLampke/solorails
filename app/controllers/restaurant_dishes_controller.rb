class RestaurantDishesController < ApplicationController
    def index 
        @dishes = Dish.same_id(params[:restaurant_id])
    end
end