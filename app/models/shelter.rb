class Shelter < ApplicationRecord
    validates_presence_of :name, :address, :city, :state, :zip
    has_many :pets, dependent: :destroy

    #need to add model test
    def pet_count
        pets.count
    end
end