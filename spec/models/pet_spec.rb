require 'rails_helper'

RSpec.describe Pet, type: :model do
    describe "validations" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:sex) }
        it { should validate_presence_of(:age) }
    end

    describe "relationships" do
        it { should belong_to(:shelter) }
        it { should have_many :adoption_pets}
        it { should have_many(:adoptions).through(:adoption_pets)}
    end
<<<<<<< HEAD
    #need to add second expectation once adoption stauts can be changed
    describe "#adoptable?" do
        it "can return pets adoption status as string" do
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

            expect(pet1.adoptable?).to eq("Adoptable") 
        end
    end
    
    
end
=======
end
>>>>>>> mg_apply
