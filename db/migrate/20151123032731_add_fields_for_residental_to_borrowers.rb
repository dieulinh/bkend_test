class AddFieldsForResidentalToBorrowers < ActiveRecord::Migration
  def change
    add_column :borrowers, :address, :string
    add_column :borrowers, :mortage_payment, :decimal, precision: 7, scale: 2
    add_column :borrowers, :mortage_insurrance, :decimal, precision: 7, scale: 2
    add_column :borrowers, :homeowner_insurrance, :decimal, precision: 7, scale: 2
    add_column :borrowers, :property_tax, :decimal, precision: 7, scale: 2
    add_column :borrowers, :hoa_due, :decimal, precision: 7, scale: 2
  end
end
