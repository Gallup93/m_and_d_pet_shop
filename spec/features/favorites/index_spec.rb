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
      @pet2 = @shelter2.pets.create(name: "Geraldo", 
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
  end
end
