class AddPropertyTypeToBorrowers < ActiveRecord::Migration
  def change
    add_column :borrowers, :property_type, :integer
  end
end
