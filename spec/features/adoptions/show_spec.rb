# require 'rails_helper'
#
# RSpec.describe "Application show page" do
#   context "as a visitor" do
#     it "displays submitted form info" do
#       @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave",
#                                 city: "Richmond", state: "VA", zip: "12345")
#       @pet1 = @shelter1.pets.create(name: "Geraldo",
#                                   image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
#                                   age: 2,
#                                   sex: "male")
#       @pet2 = @shelter1.pets.create(name: "Hector",
#                                   image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg",
#                                   age: 4,
#                                   sex: "male")
#
#       visit "/pets/#{@pet1.id}"
#       click_button "Add to your Favorites"
#       visit "/pets/#{@pet2.id}"
#       click_button "Add to your Favorites"
#
#       visit "/favorites"
#
#       click_link "Apply Now!"
#
#       within ".adoption_pet-#{@pet1.id}" do
#         expect(page).to have_field('check_box[]', checked: false)
#       end
#
#       within ".adoption_pet-#{@pet1.id}" do
#         check "check_box[]"
#       end
#       within ".adoption_pet-#{@pet2.id}" do
#         check "check_box[]"
#       end
#
#       fill_in :name, with: "Hank Hill"
#       fill_in :address, with: "23 Landry Blvd"
#       fill_in :city, with: "Arlen"
#       fill_in :state, with: "Texas"
#       fill_in :zip, with: "23412"
#       fill_in :phone, with: "815-394-0850"
#       fill_in :description, with: "A good loving American home"
#
#       click_button "Submit"
#
#       visit "/adoptions/#{Adoption.last.id}"
#
#       expect(page).to have_content("Hank Hill")
#       expect(page).to have_content("23 Landry Blvd")
#       expect(page).to have_content("Arlen")
#       expect(page).to have_content("Texas")
#       expect(page).to have_content("23412")
#       expect(page).to have_content("815-394-0850")
#
#       expect(page).to have_content("Pets being applied for:")
#       expect(page).to have_link("#{@pet1.name}")
#       click_link "#{@pet2.name}"
#       expect(current_path).to eq("/pets/#{@pet2.id}")
#     end
#   end
# end


# [ ] done
#
# User Story 19, Application Show Page
#
# As a visitor
# When I visit an applications show page "/applications/:id"
# I can see the following:
# - name
# - address
# - city
# - state
# - zip
# - phone number
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pet's that this application is for (all names of pets should be links to their show page)
