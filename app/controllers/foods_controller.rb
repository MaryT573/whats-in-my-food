class FoodsController < ApplicationController
    def index
        @foods = FoodFacade.search_list_by_food(params[:q])   
    end
  end