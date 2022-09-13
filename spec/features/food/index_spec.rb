require 'rails_helper'

RSpec.describe "Food index" do
    it 'count of food items with that amount' do
        visit '/'
        fill_in "q", with: "sweet potatoes"
        click_on "Search"
        expect(current_path).to eq("/foods")
        expect(page).to have_content("Food Count: 50")
    end

    it 'shows top 10' do
        visit '/'
        fill_in "q", with: "sweet potatoes"
        click_on "Search"
        expect(current_path).to eq("/foods")

        within "#10foods" do
            save_and_open_page
            expect(page).to have_content("1. Food Name: SWEET POTATOES")
            expect(page).to have_content("Food Brand: NOT A BRANDED ITEM")
            expect(page).to have_content("Food Ingredients: ORGANIC SWEET POTATOES.")
            expect(page).to have_content("Food Code: 983525")

            expect(page).to have_content("10. Food Name: SWEET POTATOES")
            
            expect(page).to_not have_content("11. Food Name: SWEET POTATOES")
        end
    end
end