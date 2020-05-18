# require 'rails_helper'
#
# RSpec.describe "pet adoption index page" do
#   context "as a visitor" do
#     it "has link to view all apps for a pet" do
#       @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave",
#                                   city: "Richmond", state: "VA", zip: "12345")
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
#         check "check_box[]"
#       end
#
#       fill_in :name, with: "Bobby Hill"
#       fill_in :address, with: "23 Landry Blvd"
#       fill_in :city, with: "Arlen"
#       fill_in :state, with: "Texas"
#       fill_in :zip, with: "23412"
#       fill_in :phone, with: "815-394-0850"
#       fill_in :description, with: "A good loving American home"
#
#       click_button "Submit"
#
#       visit "/pets/#{@pet1.id}"
#
#       click_link "See current applications"
#
#       expect(current_path).to eq("/applications/index/#{@pet1.id}")
#       expect(page).to have_link("Hank Hill")
#
#       click_link "Bobby Hill"
#
#       expect(current_path).to eq("/applications/#{Adoption.last.id}")
#
#
#     end
#   end
# end

# [ ] done
#
# User Story 20, Pet Applications Index Page
#
# As a visitor
# When I visit a pets show page
# I see a link to view all applications for this pet
# When I click that link
# I can see a list of all the names of applicants for this pet
# Each applicant's name is a link to their application show page
