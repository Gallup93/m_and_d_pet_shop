require 'rails_helper'

RSpec.describe "pet show page" do
  context "as a visitor" do
    it "can a pets info" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male")

        visit "/pets"

        click_link "#{pet1.name}"

        expect(current_path).to eq("/pets/#{pet1.id}") 

        expect(page).to have_content(pet1.name) 
        expect(page).to have_css("img[src*='#{pet1.image}']") 
        expect(page).to have_content(pet1.age) 
        expect(page).to have_content(pet1.sex) 
        expect(page).to have_content(pet1.description) 
        expect(page).to have_content(pet1.adoptable?) 
    end
  end
end
