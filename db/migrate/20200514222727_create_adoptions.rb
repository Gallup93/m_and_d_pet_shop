class CreateAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :adoptions do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.string :description
    end
  end
end
