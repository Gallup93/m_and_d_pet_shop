require 'rails_helper'

RSpec.describe Favorites do
  subject { Favorites.new([]) } 
  before(:each) do
    @shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
    @pet1 = @shelter1.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                  age: 2,
                                  sex: "male")
    @pet2 = @shelter1.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg", 
                                  age: 4,
                                  sex: "male")
  end
  
  describe "#total_count" do
    it "it can calculate total number of favorite pets" do
      subject.add_pet(@pet1.id)
      subject.add_pet(@pet2.id)

      expect(subject.total_count).to eq(2) 
    end

  describe "#add_pet" do
    it "can add a pet to its contents" do
      subject.add_pet(@pet1.id)
      subject.add_pet(@pet2.id)
    # binding.pry
      expect(subject.contents).to eq([@pet1.id.to_s, @pet2.id.to_s]) 
    end
  end
  
  end
end
