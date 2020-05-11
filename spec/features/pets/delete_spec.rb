require 'rails_helper'

RSpec.describe "pet delete page" do
  context "as a visitor" do
    it "can delete a pet from its show page" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male")

        visit "/pets/#{pet1.id}"

        click_link "Delete Pet"

        expect(current_path).to eq("/pets") 

        expect(page).to_not have_content("Geraldo")
        expect(page).to_not have_css("img[src*='https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg']") 
    end
  end
end
