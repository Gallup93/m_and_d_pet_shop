require 'rails_helper'

RSpec.describe "Shelter reviews" do
  context "as a user" do
    it "can be deleted" do
      shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
      review1 = shelter1.reviews.create(title: "Bad Store",
                                          rating: 1,
                                          content: "stole my money",
                                          image: "https://images.freeimages.com/images/large-previews/3d7/stubbed-toe-or-forgotten-briefcase-1194346.jpg")
      review2 = shelter1.reviews.create(title: "Good Store",
                                          rating: 5,
                                          content: "gave me money",
                                          image: "https://images.freeimages.com/images/large-previews/c87/stig-1564940.jpg")
      visit "/shelters/#{shelter1.id}"

      within ".review-#{review1.id}" do
        click_link 'Delete Review'
      end

      expect(current_path).to eq("/shelters/#{shelter1.id}")

      expect(page).to have_content(review2.title)
      expect(page).to_not have_content(review1.title)
    end
  end
end
