FactoryGirl.define do
  factory :borrower do
    first_name 'John'
    last_name 'Allan'
    email 'johna@example.com'
    base_income 9866.00
    rental_income 389.00
    commission 345.00
    credit_score 480.00
    mortage_payment 345.78
    mortage_insurrance 12.77
    homeowner_insurrance 69.12
    property_tax 56.00
    hoa_due 45.56
    property_type Borrower.all_property_types['4-plex']
  end
end