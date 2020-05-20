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
  end

  describe "#add_pet" do
    it "can add a pet to its contents" do
      subject.add_pet(@pet1.id)
      subject.add_pet(@pet2.id)

      expect(subject.contents).to eq([@pet1.id.to_s, @pet2.id.to_s]) 
    end
  end

  describe "#find_fav_pet" do
    it "can find pet through favorite contents" do
      subject.add_pet(@pet1.id)
      subject.add_pet(@pet2.id)
      pet = subject.contents[0].to_i

      expect(subject.find_fav_pet(pet)).to eq(@pet1) 
    end
  end

  describe "#delete_fav_pet" do
    it "can delete a pet from favorites" do
      subject.add_pet(@pet1.id)
      subject.add_pet(@pet2.id)
      subject.delete_fav_pet(@pet1.id)

      expect(subject.contents).to eq([@pet2.id.to_s])
    end
  end

  describe "#favorite?" do
    it "can return if pet has been favorited" do
      subject.add_pet(@pet1.id)
      expect(subject.favorite?(@pet1.id)).to eq(true) 
      expect(subject.favorite?(@pet2.id)).to eq(false) 
    end
  end

  describe "#all_favorites" do
    it "can return if pet has been favorited" do
      subject.add_pet(@pet1.id)
      subject.add_pet(@pet2.id)
      expect(subject.all_favorites).to eq([@pet1, @pet2])
    end
  end
end
