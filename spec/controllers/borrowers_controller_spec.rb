require 'rails_helper'

RSpec.describe BorrowersController, type: :controller do
  describe "#create" do
    context "Success" do
      let!(:borrower_params) { FactoryGirl.attributes_for(:borrower) }

      it "change database record number" do
        expect{ post :create, borrower:  borrower_params }.to change(Borrower, :count).by 1
      end
    end 

    context "Failed to create" do
      let!(:borrower_params) { FactoryGirl.attributes_for(:borrower, credit_score: 670) }

      it "allows authenticated access" do
        expect{ post :create, borrower:  borrower_params }.not_to change(Borrower, :count)
      end
    end 
  end

 
end