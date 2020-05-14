require 'rails_helper'

RSpec.describe Favorites do
  
  describe "#total_count" do
    it "it can calculate total number of favorite pets" do
      favorites = Favorites.new({
        1 => 1,
        2 => 1,
        3 => 1
      })

      expect(favorites.total_count).to eq(3) 
    end
  end
end
