class DishesController < ApplicationController
  def index
    if params[:restaurant_id].nil?
      @dishes = Dish.all
    else
      @dishes = Dish.where(restaurant_id: params[:restaurant_id])
    end
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
