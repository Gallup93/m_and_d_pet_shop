class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :age
      t.string :sex
      t.boolean :adoption_status, default: true
      t.timestamps
    end
  end
end
