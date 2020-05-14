class Favorites
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Array.new
  end

  def total_count
    @contents.length
  end

  def add_pet(pet_id)
    @contents << pet_id.to_s
  end
  
  def find_fav_pet(pet_id)
    Pet.find(pet_id.to_i)
  end
  
  

end