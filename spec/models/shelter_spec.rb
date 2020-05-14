require 'rails_helper'

RSpec.describe Shelter, type: :model do 
    describe "validations" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:address) }
        it { should validate_presence_of(:city) }
        it { should validate_presence_of(:state) }
        it { should validate_presence_of(:zip) }
    end

    describe "relationships" do
        it { should have_many :pets}
        it { should have_many :reviews}
    end

    describe "#pet_count" do
        it "can return total count of pets at a shelter" do

            shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
            pet1 = shelter1.pets.create(name: "Geraldo", 
                                  image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                  age: 2,
                                  sex: "male")
            pet2 = shelter1.pets.create(name: "Paula", 
                                  image: "https://images.freeimages.com/images/large-previews/1f1/prairiedog-1515344.jpg", 
                                  age: 9,
                                  sex: "female",
                                  description: "Has a bad habit of digging holes") 
            
            expect(shelter1.pet_count).to eq(2) 
        end
    end
end