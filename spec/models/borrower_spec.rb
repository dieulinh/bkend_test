require 'rails_helper'

RSpec.describe Borrower, type: :model do
  describe "It should have valid data as a borrower" do
    let!(:borrower) { FactoryGirl.create(:borrower) }
    
    it { should define_enum_for(:all_property_type).with({ single: 'single family', duplex: 'duplex', triplex: 'triplex', four_plex: '4-plex', condo: 'condo', others: 'others'}) }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_numericality_of(:base_income).is_greater_than(0) } 
    it { should validate_numericality_of(:rental_income).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:credit_score).is_less_than_or_equal_to(620) } 
    describe 'check if property_type in allowed list' do
      let(:borrower) { FactoryGirl.build(:borrower, property_type: Borrower.others}
      it 'should return error message' do
        borrower.validate
        expect(borrower.errors[:property_type]).to include("Sorry, your subject property is not eligible.\
       We only offer loan programs for residential 1-4 units at this time")
      end
    end
  end
end