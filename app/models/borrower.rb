class Borrower < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_numericality_of :base_income, greater_than: 0
  validates_numericality_of :rental_income, greater_than_or_equal_to: 0
  validates_numericality_of :credit_score, less_than_or_equal_to: 620
end