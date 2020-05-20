class AddApprovalToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :approval, :boolean, default: false
  end
end
