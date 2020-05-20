require 'rails_helper'

RSpec.describe "Application show page" do
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
      @adoption1 = Adoption.create(name: "Jo Bob", address: "123 Street", city: "Toronto", state: "AK", zip: 3, phone: 9, description: "hlkjkl")
      @adoption_pet1 = AdoptionPet.create(pet_id: @pet1.id, adoption_id: @adoption1.id)

    end

    it "displays submitted form info" do

      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/pets/#{@pet2.id}"
      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Apply Now!"

      within ".adoption_pet-#{@pet1.id}" do
        expect(page).to have_field('check_box[]', checked: false)
      end

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

      visit "/adoptions/#{Adoption.last.id}"

      expect(page).to have_content("Hank Hill")
      expect(page).to have_content("23 Landry Blvd")
      expect(page).to have_content("Arlen")
      expect(page).to have_content("Texas")
      # expect(page).to have_content("23412")
      # expect(page).to have_content("815")

      expect(page).to have_content("Pets being applied for:")
      expect(page).to have_link("#{@pet1.name}")
      click_link "#{@pet2.name}"
      expect(current_path).to eq("/pets/#{@pet2.id}")
    end

    it "can approve a pet application" do

      visit "/adoptions/#{@adoption1.id}"

      within ".approvals-#{@pet1.id}" do
        click_link "Approve Adoption"
      end

      expect(current_path).to eq("/pets/#{@pet1.id}")
      @pet1.reload
      expect(@pet1.adoption_status).to eq(false)
      expect(page).to have_content("Adoption Status: Pending Adoption")
    end

    it "can only have one approved application on a pet at a time" do
      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/favorites"
      click_link "Apply Now!"

      within ".adoption_pet-#{@pet1.id}" do
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

      id1 = Adoption.last.id

      visit "/pets/#{@pet1.id}"
      click_button "Add to your Favorites"
      visit "/favorites"
      click_link "Apply Now!"

      within ".adoption_pet-#{@pet1.id}" do
        check "check_box[]"
      end

      fill_in :name, with: "Dale Gribble"
      fill_in :address, with: "25 Alamo St"
      fill_in :city, with: "Arlen"
      fill_in :state, with: "Texas"
      fill_in :zip, with: 4
      fill_in :phone, with: 5
      fill_in :description, with: "Donjddu"

      click_button "Submit"

      id2 = Adoption.last.id

      visit "/adoptions/#{id1}"

      within ".approvals-#{@pet1.id}" do
        click_link "Approve Adoption"
      end

      visit "/adoptions/#{id2}"

      within ".approvals-#{@pet1.id}" do
        expect(page).to_not have_link("Approve Adoption")
        click_link "Revoke Adoption"
      end
      @pet1.reload
      expect(current_path).to eq("/adoptions/#{id2}")
      expect(page).to have_content("Approve Adoption")
      visit "/pets/#{@pet1.id}"
      expect(page).to have_content("Adoptable")
    end
  end
end
