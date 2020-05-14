require 'rails_helper'

RSpec.describe "pet show page" do
  context "as a visitor" do
    before(:each) do
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      @shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
      @pet1 = @shelter1.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                  age: 2,
                                  sex: "male")
      @pet2 = @shelter2.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg", 
                                  age: 4,
                                  sex: "male")
    end

    it "can add pet to favorites" do
      
      visit "/pets/#{@pet1.id}"

      click_button "Add to your Favorites"

      expect(current_path).to eq("/pets/#{@pet1.id}") 
      expect(page).to have_content("#{@pet1.name} has been added to your favorites") 
      expect(page).to have_content("Favorites: 1") 
      
    end
  end
end




# As a visitor
# When I visit a pet's show page
# I see a button or link to favorite that pet
# When I click the button or link
# I'm taken back to that pet's show page
# I see a flash message indicating that the pet has been added to my favorites list
# The favorite indicator in the nav bar has incremented by one