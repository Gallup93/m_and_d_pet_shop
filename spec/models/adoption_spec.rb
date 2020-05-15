require 'rails_helper'

RSpec.describe Adoption, type: :model do
  describe "validations" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:zip) }
      it { should validate_presence_of(:phone) }
      it { should validate_presence_of(:description) }
  end

<<<<<<< HEAD
=======
  describe "relationships" do
    it { should have_many :adoption_pets}
    it { should have_many(:pets).through(:adoption_pets)}
  end

>>>>>>> mg_apply
  #should belong to pets?
end
