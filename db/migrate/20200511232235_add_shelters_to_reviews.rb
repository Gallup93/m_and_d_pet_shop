class AddSheltersToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :shelters, foreign_key: true
  end
end
