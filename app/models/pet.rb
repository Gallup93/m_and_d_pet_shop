class Pet < ApplicationRecord
    validates_presence_of :name, :age, :sex
    validates :adoption_status, inclusion: [true, false]
    belongs_to :shelter

    #pair on fixing this per Mikes comments
    def adoptable?
        adoption_status ? "Adoptable" : "Pending Adoption"
    end
    
end