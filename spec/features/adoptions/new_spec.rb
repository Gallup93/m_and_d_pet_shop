# require 'rails_helper'
#
# RSpec.describe "linked from /favorites to /favorites/apply" do
#   context "as a visitor" do
#
#     before(:each) do
#       @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave",
#                                 city: "Richmond", state: "VA", zip: "12345")
#       @shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane",
#                                   city: "Cheyenne", state: "WY", zip: "23456")
#       @pet1 = @shelter1.pets.create(name: "Geraldo",
#                                   image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
#                                   age: 2,
#                                   sex: "male")
#       @pet2 = @shelter2.pets.create(name: "Geraldo",
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
#     end
#
#     it "can create a new application for selected favorite pets" do
#
#       expect(current_path).to eq("/favorites/apply")
#       expect(page).to have_content("#{@pet1.name}")
#       expect(page).to have_content("#{@pet2.name}")
#
#       #Test user can select the pets they wish (select_tag??)
#       #Select only pet2
#
#       fill_in :name, with: "Hank Hill"
#       fill_in :address, with: "23 Landry Blvd"
#       fill_in :city, with: "Arlen"
#       fill_in :state, with: "Texas"
#       fill_in :zip, with: "23412"
#       fill_in :phone_number, with: "815-394-0850"
#       fill_in :description, with: "A good loving American home"
#
#       click_button "Submit"
#
#       expect(current_path).to eq("/favorites")
#       expect(page).to have_content("Application submitted!")
#       expect(page).to have_content("#{@pet1.name}")
#       expect(page).to_not have_content("#{@pet2.name}")
#     end

    # it "cannot submit application without required forms filled" do
    #   expect(current_path).to eq("/favorites/apply")
    #   expect(page).to have_content("#{@pet1.name}")
    #   expect(page).to have_content("#{@pet2.name}")
    #
    #   #SELECT PET
    #
    #   fill_in :name, with: "Hank Hill"
    #   fill_in :address, with: "23 Landry Blvd"
    #   #Leave 'city' blank
    #   fill_in :state, with: "Texas"
    #   fill_in :zip, with: "23412"
    #   fill_in :phone_number, with: "815-394-0850"
    #   fill_in :description, with: "A good loving American home"
    #
    #   click_button "Submit"
    #
    #   expect(current_path).to eq("/favorites/apply")
    #   expect(page).to have_content("ERROR! Missing required form field(s)")
    #
    # end
#   end
# end

# User Story 16, Applying for a Pet
#
# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# I see a link for adopting my favorited pets
# When I click that link I'm taken to a new application form
# At the top of the form, I can select from the pets of which I've favorited for which I'd like this application to apply towards (can be more than one)
# When I select one or more pets, and fill in my
# - Name
# - Address
# - City
# - State
# - Zip
# - Phone Number
# - Description of why I'd make a good home for this/these pet(s)
# And I click on a button to submit my application
# I see a flash message indicating my application went through for the pets that were selected
# And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites


# User Story 17, Incomplete application for a Pet
#
# As a visitor
# When I apply for a pet and fail to fill out any of the following:
# - Name
# - Address
# - City
# - State
# - Zip
# - Phone Number
# - Description of why I'd make a good home for this/these pet(s)
# And I click on a button to submit my application
# I'm redirect back to the new application form to complete the necessary fields
# And I see a flash message indicating that I must complete the form in order to submit the application
