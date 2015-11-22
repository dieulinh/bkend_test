FactoryGirl.define do
  factory :borrower do
    first_name 'John'
    last_name 'Allan'
    email 'johna@example.com'
    base_income 9866.00
    rental_income 389.00
    commission 345.00
    credit_score 480.00
  end
end