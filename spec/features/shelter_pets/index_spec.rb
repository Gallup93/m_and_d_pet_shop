require 'rails_helper'

RSpec.describe "shelter pet index page" do
  context "as a visitor" do
    before(:each) do 
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      @pet1 = @shelter1.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                  age: 2,
                                  sex: "male")
    end

    it "has link to update pet info" do
    
      visit "/shelters/#{@shelter1.id}/pets"
      
      within ".pets-#{@pet1.id}" do 
        click_link "Update Pet Info"
        expect(current_path).to eq("/pets/#{@pet1.id}/edit") 
      end
    end

    it "has link to delete pet" do
    
      visit "/shelters/#{@shelter1.id}/pets"
      
      within ".pets-#{@pet1.id}" do 
        click_link "Delete Pet"
        expect(current_path).to eq(pets_path) 
      end
    end
  end
end
