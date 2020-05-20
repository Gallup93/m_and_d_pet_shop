require 'rails_helper'

RSpec.describe "shelter delete page" do
  context "as a visitor" do
    it "can delete a shelter from its show page" do
      
        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
        
        visit "/shelters/#{shelter1.id}"

        click_link "Delete Shelter"

        expect(current_path).to eq("/shelters") 

        expect(page).to_not have_content(shelter1.name) 
        expect(page).to_not have_content("Randys Rodent Ranch") 
        expect(page).to have_content(shelter2.name) 
    end

    it "cannot delete a shelter that has pets with pending adoptions" do

      shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      s1_pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male",
                                    description: "Cute with an attitude",
                                    adoption_status: false)
      s1_pet2 = shelter1.pets.create(name: "Paula", 
                                    image: "https://images.freeimages.com/images/large-previews/1f1/prairiedog-1515344.jpg", 
                                    age: 9,
                                    sex: "female",
                                    description: "Has a bad habit of digging holes")

      visit "/shelters/#{shelter1.id}"

      click_link "Delete Shelter"

      expect(current_path).to eq("/shelters/#{shelter1.id}") 
      expect(page).to have_content("Cannot delete this shelter with pets that pending adoptions!") 
    end
    
  end
end
