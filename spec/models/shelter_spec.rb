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

    describe "#average_rating" do
        it "can return average review rating" do
            shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
            review1 = shelter1.reviews.create(title: "Bad Store", 
                                    rating: 2, 
                                    content: "stole my money",
                                    image: "https://images.freeimages.com/images/large-previews/3d7/stubbed-toe-or-forgotten-briefcase-1194346.jpg")
            review2 = shelter1.reviews.create(title: "Good Store", 
                                    rating: 4, 
                                    content: "gave me money",
                                    image: "https://images.freeimages.com/images/large-previews/c87/stig-1564940.jpg")
            
            expect(shelter1.average_rating).to eq(3) 
        end
    end
    describe "#adoptions_count" do
        it "can return number of pet adoptions" do
            shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
            pet1 = shelter1.pets.create(name: "Geraldo",
                                        image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg",
                                        age: 2,
                                        sex: "male")
            pet2 = shelter1.pets.create(name: "Hector",
                                        image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg",
                                        age: 4,
                                        sex: "male")
            adoption1 = Adoption.create(name: "Jo Bob", address: "123 Street", city: "Toronto", state: "AK", zip: 3, phone: 9, description: "hlkjkl")
            adoption2 = Adoption.create(name: "Fran", address: "Maple Dr", city: "Denver", state: "CO", zip: 5, phone: 7, description: "text")
            adoption_pet1 = AdoptionPet.create(pet_id: pet1.id, adoption_id: adoption1.id)
            adoption_pet2 = AdoptionPet.create(pet_id: pet2.id, adoption_id: adoption2.id)

            expect(shelter1.adoptions_count).to eq(2) 
        end
    end
    
end