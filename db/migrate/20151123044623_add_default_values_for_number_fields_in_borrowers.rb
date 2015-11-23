class AddDefaultValuesForNumberFieldsInBorrowers < ActiveRecord::Migration
  def change
    change_column :borrowers, :base_income, :decimal, precision: 7, scale: 2, default: 0
    change_column :borrowers, :rental_income, :decimal, precision: 7, scale: 2, default: 0
    change_column :borrowers, :commission, :decimal, precision: 7, scale: 2, default: 0
    change_column :borrowers, :mortage_payment, :decimal, precision: 7, scale: 2, default: 0
    change_column :borrowers, :mortage_insurrance, :decimal, precision: 7, scale: 2, default: 0
    change_column :borrowers, :homeowner_insurrance, :decimal, precision: 7, scale: 2
    change_column :borrowers, :property_tax, :decimal, precision: 7, scale: 2, default: 0
    change_column :borrowers, :hoa_due, :decimal, precision: 7, scale: 2
  end
end
