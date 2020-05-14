require 'rails_helper'

RSpec.describe "shelter reviews" do
  context "as a visitor" do
    before(:each) do
      @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      @review1 = @shelter1.reviews.create(title: "Bad Store",
                                          rating: 1,
                                          content: "stole my money",
                                          image: "https://images.freeimages.com/images/large-previews/3d7/stubbed-toe-or-forgotten-briefcase-1194346.jpg")
      @review2 = @shelter1.reviews.create(title: "Good Store",
                                          rating: 5,
                                          content: "gave me money",
                                          image: "https://images.freeimages.com/images/large-previews/c87/stig-1564940.jpg")
    end

    it "can see a list of reviews from a shelters show page" do

      visit "/shelters/#{@shelter1.id}"

      within ".review-#{@review1.id}" do
        expect(page).to have_content(@review1.title)
        expect(page).to have_content(@review1.rating)
        expect(page).to have_content(@review1.content)
        expect(page).to have_css("img[src*='#{@review1.image}']")
        expect(page).to have_link("Edit Review")
      end

      within ".review-#{@review2.id}" do
        expect(page).to have_content(@review2.title)
        expect(page).to have_content(@review2.rating)
        expect(page).to have_content(@review2.content)
        expect(page).to have_css("img[src*='#{@review2.image}']")
        expect(page).to have_link("Edit Review")
      end
    end
  end
end



# As a visitor,
# When I visit a shelter's show page,
# I see a list of reviews for that shelter
# Each review will have:
# - title
# - rating
# - content
# - an optional picture
