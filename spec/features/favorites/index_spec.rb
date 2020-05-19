require 'rails_helper'

RSpec.describe "favorites index page" do
  context "as a visitor" do
    before(:each) do
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      @shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
      @pet1 = @shelter1.pets.create(name: "Geraldo",
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
                                    age: 2,
                                    sex: "male")
      @pet2 = @shelter2.pets.create(name: "Susan",
      image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg",
      age: 4,
      sex: "male")
    end

    it "can see all favorited pets with name as link to show page and image" do

      visit "/pets/#{@pet1.id}"

      click_button "Add to your Favorites"

      visit "/pets/#{@pet2.id}"

      click_button "Add to your Favorites"

      click_link "Favorites: 2"

      expect(current_path).to eq("/favorites")

      within ".fav_pets-#{@pet1.id}" do
        expect(page).to have_link("#{@pet1.name}")
        expect(page).to have_css("img[src*='#{@pet1.image}']")
      end

      within ".fav_pets-#{@pet2.id}" do
        expect(page).to have_link("#{@pet2.name}")
        expect(page).to have_css("img[src*='#{@pet2.image}']")
      end
    end

    it "lists all pets that have at least one app on them. Each name is a link to pet show page." do
      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/pets/#{@pet2.id}"
      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Apply Now!"

      within ".adoption_pet-#{@pet2.id}" do
        check "check_box[]"
      end

      fill_in :name, with: "Hank Hill"
      fill_in :address, with: "23 Landry Blvd"
      fill_in :city, with: "Arlen"
      fill_in :state, with: "Texas"
      fill_in :zip, with: 3
      fill_in :phone, with: 2
      fill_in :description, with: "A good loving American home"

      click_button "Submit"

      expect(current_path).to eq("/favorites")

      expect(page).to have_content("Pets with applications:")
      # binding.pry
      within ".pets_with_apps-#{@pet2.id}" do

        expect(page).to_not have_content("#{@pet1.name}")
        click_link "#{@pet2.name}"
        expect(current_path).to eq("/pets/#{@pet2.id}")
      end
    end
  end
end

# [ ] done
#
# User Story 18, List of Pets that have applications on them
#
# As a visitor
# After one or more applications have been created
# When I visit the favorites index page
# I see a section on the page that has a list of all of the pets that have at least one application on them
# Each pet's name is a link to their show page
