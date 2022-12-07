class DishesController < ApplicationController
  def index
    @dishes = Dish.available_yes
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
