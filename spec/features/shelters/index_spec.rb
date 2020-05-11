require 'rails_helper'

RSpec.describe "shelter index page" do
  context "as a visitor" do
    before(:each) do 

      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      @shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")

    end

    it "can see name of each shelter" do

        visit "/shelters"

        expect(page).to have_content(@shelter1.name) 
        expect(page).to have_link(@shelter2.name) 

    end

    it "has link to edit shelter" do
      
      visit "/shelters"
      
      within ".shelter-#{@shelter1.id}" do

        click_link "Edit Shelter"

        expect(current_path).to eq("/shelters/#{@shelter1.id}/edit") 
      end
    end

      it "has link to delete shelter" do
      
        visit "/shelters"
        
        within ".shelter-#{@shelter2.id}" do
  
          click_link "Delete Shelter"
  
          expect(current_path).to eq("/shelters") 
        end
      end
  end
end
