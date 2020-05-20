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

        expect(page).to_not have_content(pet1.name)
        expect(page).to_not have_css("img[src*='https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg']")
    end

    it "cannot delete a pet with approved adoption" do
      shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      pet1 = shelter1.pets.create(name: "Geraldo",
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
                                  age: 2,
                                  sex: "male")

      visit "/pets/#{pet1.id}"

      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Apply Now!"

      within ".adoption_pet-#{pet1.id}" do
        check "check_box[]"
      end

      fill_in :name, with: "Hank Hill"
      fill_in :address, with: "23 Landry Blvd"
      fill_in :city, with: "Arlen"
      fill_in :state, with: "Texas"
      fill_in :zip, with: "23412"
      fill_in :phone, with: "815-394-0850"
      fill_in :description, with: "A good loving American home"

      click_button "Submit"

      visit "/adoptions/#{Adoption.last.id}"

      click_link "Approve Adoption"

      visit "/pets/#{pet1.id}"

      expect(page).to_not have_content("Delete Pet")

      visit "/pets"

      within ".pet-#{pet1.id}" do
        expect(page).to_not have_content("Delete Pet")
      end
    end
  end
end
