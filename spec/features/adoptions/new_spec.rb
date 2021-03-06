require 'rails_helper'

RSpec.describe "linked from /favorites to /favorites/apply" do
  context "as a visitor" do

    before(:each) do
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave",
                                city: "Richmond", state: "VA", zip: "12345")
      @shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane",
                                  city: "Cheyenne", state: "WY", zip: "23456")
      @pet1 = @shelter1.pets.create(name: "Geraldo",
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
                                  age: 2,
                                  sex: "male")
      @pet2 = @shelter2.pets.create(name: "Hector",
                                  image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg",
                                  age: 4,
                                  sex: "male")

      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/pets/#{@pet2.id}"
      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Apply Now!"
    end

    it "can create a new application for selected favorite pets" do

      expect(current_path).to eq("/adoptions/new")

      within ".adoption_pet-#{@pet1.id}" do
        expect(page).to have_field('check_box[]', checked: false)
      end

      within ".adoption_pet-#{@pet2.id}" do
        check "check_box[]"
        expect(page).to have_checked_field("check_box[]")
      end

      fill_in :name, with: "Hank Hill"
      fill_in :address, with: "23 Landry Blvd"
      fill_in :city, with: "Arlen"
      fill_in :state, with: "Texas"
      fill_in :zip, with: "23412"
      fill_in :phone, with: "815-394-0850"
      fill_in :description, with: "A good loving American home"

      click_button "Submit"

      expect(current_path).to eq("/favorites")
      expect(page).to have_content("Application submitted!")
      expect(page).to have_content("#{@pet1.name}")
      # Need to add within block to test this accurately
      # expect(page).to_not have_content("#{@pet2.name}")
    end

    it "cannot submit application without required forms filled" do
      expect(current_path).to eq("/adoptions/new")

      within ".adoption_pet-#{@pet2.id}" do
        check "check_box[]"
      end

      fill_in :name, with: "Hank Hill"
      fill_in :address, with: "23 Landry Blvd"
      #Leave 'city' blank
      fill_in :state, with: "Texas"
      fill_in :zip, with: "23412"
      fill_in :phone, with: "815-394-0850"
      fill_in :description, with: "A good loving American home"

      click_button "Submit"

      expect(current_path).to eq("/adoptions/new")
      expect(page).to have_content("ERROR! Missing required form field(s)")

      #no favorite is selected
      fill_in :name, with: "Hank Hill"
      fill_in :address, with: "23 Landry Blvd"
      fill_in :city, with: "Arlen"
      fill_in :state, with: "Texas"
      fill_in :zip, with: "23412"
      fill_in :phone, with: "815-394-0850"
      fill_in :description, with: "A good loving American home"

      click_button "Submit"

      expect(current_path).to eq("/adoptions/new")
      expect(page).to have_content("ERROR! Missing required form field(s)")
    end
  end
end
