require 'rails_helper'

RSpec.describe FoodService do
    it 'gets data from api' do
        foods = FoodService.search_food('cheese') 
        expect(foods).to be_a(Hash) 
        expect(foods[:foods]).to be_a(Array)
        
        food = foods[:foods].first
        
        expect(food[:description]).to be_a(String)
        expect(food[:fdcId]).to be_a(Integer)
        expect(food[:brandOwner]).to be_a(String)
        expect(food[:ingredients]).to be_a(String)
    end
end