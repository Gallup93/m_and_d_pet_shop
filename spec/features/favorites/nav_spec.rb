require 'rails_helper'

RSpec.describe "nav bar" do
  context "as a visitor" do
    it "can see a favorites indicator that shows a count of favorited pets" do
      
      shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")

      visit "/shelters"

      expect(page).to have_content("Favorites:") 
    end
  end
end