require 'rails_helper'

RSpec.describe Pet, type: :model do 
    describe "validations" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:sex) }
        it { should validate_presence_of(:age) }
    end

    describe "relationships" do
        it { should belong_to(:shelter) }
    end
    
end