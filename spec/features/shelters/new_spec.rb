require 'rails_helper'

RSpec.describe "shelter new page" do
  context "as a visitor" do
    it "create a new shelter" do

        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")

        visit "/shelters"

        click_link "Add New Shelter"

        expect(current_path).to eq("/shelters/new") 

        fill_in :name,	with: "Bob" 
        fill_in :address,	with: "222 St" 
        fill_in :city,	with: "Denver" 
        fill_in :state,	with: "CO" 
        fill_in :zip,	with: "80220" 

        click_button "Create Shelter"

        expect(current_path).to eq("/shelters")

        expect(page).to have_content("Bob") 
    end
  end
end
