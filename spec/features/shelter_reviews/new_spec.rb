require 'rails_helper'

RSpec.describe "linked from shelters show to reviews new page" do
  context "as a visitor" do
    it "can create a new shelter review" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")

        visit "/shelters/#{shelter1.id}"

        expect(current_path).to eq("/shelters/#{shelter1.id}")

        click_link "Add Review"

        expect(current_path).to eq("/shelters/#{shelter1.id}/reviews/new")

        fill_in :title,	with: "Stolen identity1"
        fill_in :rating,	with: 3
        fill_in :content,	with: "The rat I purchased stole my SSN!"
        fill_in :image,	with: "https://www.freeimages.com/photo/grey-rat-with-cheese-1322331"
        click_button "Submit Review"

        expect(current_path).to eq("/shelters/#{shelter1.id}")
        # shelter1.reload
        expect(page).to have_content("Stolen identity1")
        expect(page).to have_content(3)
        expect(page).to have_content("The rat I purchased stole my SSN!")
        expect(page).to have_css("img[src*='https://www.freeimages.com/photo/grey-rat-with-cheese-1322331']")
    end

    it "cannot create a shelter review without a title, rating, content" do
      shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")

      visit "/shelters/#{shelter1.id}/reviews/new"

      fill_in :title,	with: "Stolen identity"
      #Rating not filled in
      fill_in :content,	with: "The rat I purchased stole my SSN!"
      fill_in :image,	with: "https://www.freeimages.com/photo/grey-rat-with-cheese-1322331"

      click_button "Submit Review"

      expect(current_path).to eq("/shelters/#{shelter1.id}/reviews/new")

      expect(page).to have_content("Form Error: please include a title, rating, and content")
    end
  end
end
