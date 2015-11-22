class ChangeNumberFieldsInBorrowersFromIntegerToDecimal < ActiveRecord::Migration
  def up
    change_column :borrowers, :base_income, :decimal, precision: 7, scale: 2
    change_column :borrowers, :rental_income, :decimal, precision: 7, scale: 2
    change_column :borrowers, :credit_score, :decimal, precision: 7, scale: 2
    change_column :borrowers, :commission, :decimal, precision: 7, scale: 2
  end
  def down
    change_column :borrowers, :base_income, :integer
    change_column :borrowers, :rental_income, :integer
    change_column :borrowers, :credit_score, :integer
    change_column :borrowers, :commission, :integer
  end
end
