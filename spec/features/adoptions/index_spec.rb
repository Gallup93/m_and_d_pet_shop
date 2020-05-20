require 'rails_helper'

RSpec.describe "pet adoption index page" do
  context "as a visitor" do
    before(:each) do
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave",
                                  city: "Richmond", state: "VA", zip: "12345")
      @pet1 = @shelter1.pets.create(name: "Geraldo",
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
                                  age: 2,
                                  sex: "male")
      @pet2 = @shelter1.pets.create(name: "Hector",
                                  image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg",
                                  age: 4,
                                  sex: "male")
    end  

    it "has link to view all apps for a pet" do

      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/pets/#{@pet2.id}"
      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Apply Now!"

      within ".adoption_pet-#{@pet1.id}" do
        check "check_box[]"
      end
      within ".adoption_pet-#{@pet2.id}" do
        check "check_box[]"
      end

      fill_in :name, with: "Hank Hill"
      fill_in :address, with: "23 Landry Blvd"
      fill_in :city, with: "Arlen"
      fill_in :state, with: "Texas"
      fill_in :zip, with: 1
      fill_in :phone, with: 2
      fill_in :description, with: "A good loving American home"

      click_button "Submit"

      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/pets/#{@pet2.id}"
      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Apply Now!"

      within ".adoption_pet-#{@pet1.id}" do
        check "check_box[]"
      end

      fill_in :name, with: "Bobby Flay"
      fill_in :address, with: "666 Hell Lane"
      fill_in :city, with: "Phoenix"
      fill_in :state, with: "AZ"
      fill_in :zip, with: 5
      fill_in :phone, with: 9
      fill_in :description, with: "I hate animals"

      click_button "Submit"

      visit "/pets/#{@pet1.id}"

      click_link "See Current Applications"

      expect(current_path).to eq("/pets/#{@pet1.id})/adoptions")

      expect(page).to have_link("Hank Hill")

      click_link "Bobby Flay"

      expect(current_path).to eq("/adoptions/#{Adoption.last.id}")
    end

    it "displays message when no applications exist for the pet" do
      
      visit "/pets/#{@pet2.id}"

      click_link "See Current Applications"
# binding.pry
      expect(page).to have_content("There are no applications for this pet")
    end
  end
end

# [ ] done

# User Story 20, Pet Applications Index Page

# As a visitor
# When I visit a pets show page
# I see a link to view all applications for this pet
# When I click that link
# I can see a list of all the names of applicants for this pet
# Each applicant's name is a link to their application show page

# [ ] done

# User Story 21, Pet Applications Index Page When No Applications

# As a visitor
# When I visit a pet applications index page for a pet that has no applications on them
# I see a message saying that there are no applications for this pet yet
