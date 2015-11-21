require 'rails_helper'

RSpec.describe Borrower, type: :model do
  describe "It should have valid data as a borrower" do
    let!(:borrower) { FactoryGirl.create(:borrower) }
    
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_numericality_of(:base_income).is_greater_than(0) } 
    it { should validate_numericality_of(:rental_income).only_integer }
  end
end