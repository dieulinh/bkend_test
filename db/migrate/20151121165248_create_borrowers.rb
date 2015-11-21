class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :credit_score
      t.integer :base_income
      t.integer :rental_income
      t.integer :commission
      t.timestamp
    end
  end
end
