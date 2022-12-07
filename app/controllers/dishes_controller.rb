class DishesController < ApplicationController
  def index
    @dishes = Dish.available_yes
  end

  def show
    @dish = Dish.find(params[:id])
  end
  def edit 
    @dish = Dish.find(params[:id])
  end
  def update 
    @dish = Dish.find(params[:id])

    @dish.update(name: params[:name], available: params[:available], price: params[:price])
    redirect_to "/dishes" 
  end
  def destroy
    Dish.destroy(params[:id])
    redirect_to "/dishes"
    end
end
