require 'rails_helper'

RSpec.describe "review edit page" do
  context "as a visitor" do
    it "can update a review " do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        review = shelter1.reviews.create(title: "BIG MAD",
                                    rating: 1,
                                    content: "angry words",
                                    image: "https://www.freeimages.com/photo/face-mad-1511390")

        visit "/shelters/#{shelter1.id}"

        click_link "Edit Review"

        expect(current_path).to eq("/shelters/#{shelter1.id}/reviews/edit")

        fill_in :title,	with: "STILL BIG MAD"
        fill_in :rating,	with: 1
        fill_in :content,	with: "EVEN BIGGER MAD"
        fill_in :image, with: "https://www.freeimages.com/photo/face-mad-1511390"

        click_button "Update Review"

        expect(current_path).to eq("/shelters/#{shelter1.id}")

        expect(page).to have_content("STILL BIG MAD")
        expect(page).to have_content(1)
        expect(page).to have_content("EVEN BIGGER MAD")
        expect(page).to have_content("https://www.freeimages.com/photo/face-mad-1511390")

        expect(subject).to_not have_content("BIG MAD")
        expect(subject).to_not have_content("angry words")
    end
  end
end

# When I click on this link, I am taken to an edit shelter review path
# On this new page, I see a form that includes that review's pre populated data:
# - title
# - rating
# - content
# - image
# I can update any of these fields and submit the form.
# When the form is submitted, I should return to that shelter's show page
# And I can see my updated review
