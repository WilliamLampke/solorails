class RestaurantDishesController < ApplicationController
    def index 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @dishes = Dish.same_id(params[:restaurant_id])
    end
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])

    end
    def create 
        @restaurant = Restaurant.find(params[:restaurant_id])
        Dish.create!(name: params["name"], available: params["available"], price: params["price"], restaurant_id: params[:restaurant_id])
        redirect_to "/restaurants/#{@restaurant.id}/restaurant_dishes"
      end
      def edit 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @dish = Dish.find(params[:id])
        
      end
      def update
        @dish = Dish.find(params[:id])
        @dish.update(name: params[:name], available: params[:available], price: params[:price])
        redirect_to "/dishes/#{@dish.id}" 
      end
      def sort

      end
end