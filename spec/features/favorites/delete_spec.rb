require 'rails_helper'

RSpec.describe "pet show page favorites" do
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

    it "can remove pet from favorites" do

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
  end
end


# After I've favorited a pet
# When I visit that pet's show page
# I no longer see a link to favorite that pet
# But I see a link to remove that pet from my favorites
# When I click that link
# A delete request is sent to "/favorites/:pet_id"
# And I'm redirected back to that pets show page where I can see a flash message indicating that the pet was removed from my favorites
# And I can now see a link to favorite that pet
# And I also see that my favorites indicator has decremented by 1