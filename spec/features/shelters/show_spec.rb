require 'rails_helper'

RSpec.describe "shelter show page" do
  context "as a visitor" do
    it "can that shelters info" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")


        visit "/shelters/#{shelter1.id}"

        expect(page).to have_content(shelter1.name) 
        expect(page).to have_content(shelter1.address) 
        expect(page).to have_content(shelter1.city) 
        expect(page).to have_content(shelter1.state) 
        expect(page).to have_content(shelter1.zip) 
        
        expect(page).to_not have_content(shelter2.name) 
        expect(page).to_not have_content(shelter2.address) 
        expect(page).to_not have_content(shelter2.city) 
        expect(page).to_not have_content(shelter2.state) 
        expect(page).to_not have_content(shelter2.zip) 
    end
  end
end
