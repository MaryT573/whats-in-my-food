class FoodsController < ApplicationController
    def index
        @food = FoodFacade.search_list_by_food(params[:q])
        
    end

    private

    def food_params
        params.require(:food).permit(:name, :brand, :code, :ingredients, :search)
    end
  end