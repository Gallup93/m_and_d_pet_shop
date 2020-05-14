require 'rails_helper'

RSpec.describe "remove favorites" do
  context "as a visitor" do
    before(:each) do
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      @shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
      @pet1 = @shelter1.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                  age: 2,
                                  sex: "male")
      @pet2 = @shelter1.pets.create(name: "Paula", 
                                  image: "https://images.freeimages.com/images/large-previews/1f1/prairiedog-1515344.jpg", 
                                  age: 9,
                                  sex: "female",
                                  description: "Has a bad habit of digging holes")
    end

    it "can remove pet from favorites from pet show page" do

      visit "/pets/#{@pet1.id}"

      expect(page).to_not have_button("Remove from Favorites")

      click_button "Add to your Favorites"

      visit "/pets"

      click_link "#{@pet1.name}"

      expect(page).to_not have_button("Add to your Favorites")

      click_button "Remove from Favorites"

      expect(current_path).to eq("/pets/#{@pet1.id}")
      
      expect(page).to have_content("#{@pet1.name} has been removed from your favorites!") 
      expect(page).to have_content("Favorites: 0") 
    end

    it "can remove pet from favorites index page" do
      
      visit "/pets/#{@pet1.id}"

      click_button "Add to your Favorites"

      visit "/pets/#{@pet2.id}"

      click_button "Add to your Favorites"

      visit "/favorites"

      within ".fav_pets-#{@pet1.id}" do 
        click_link "Remove from Favorites"
        expect(current_path).to eq("/favorites") 
      end

      expect(page).to have_no_content(@pet1.name)
      expect(page).to_not have_css("img[src*='#{@pet1.image}']")  
    end

    it "can remove all pets from favorites" do

      visit "/pets/#{@pet1.id}"

      click_button "Add to your Favorites"

      visit "/pets/#{@pet2.id}"

      click_button "Add to your Favorites"

      visit "/favorites"

      click_link "Clear All Favorites"

      expect(current_path).to eq("/favorites") 

      expect(page).to have_no_content(@pet1.name) 
      expect(page).to_not have_css("img[src*='#{@pet1.image}']")  
      expect(page).to have_no_content(@pet2.name) 
      expect(page).to_not have_css("img[src*='#{@pet2.image}']")  
      expect(page).to have_content("You have not selected any favorite pets!") 
      expect(page).to have_content("Favorites: 0") 
    end
  end
end
# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# I see a link to remove all favorited pets
# When I click that link
# I'm redirected back to the favorites page
# I see the text saying that I have no favorited pets
# And the favorites indicator returns to 0

