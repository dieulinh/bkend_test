class BorrowersController < ApplicationController
  def new
    @borrower = Borrower.new
    @property_types = Borrower.all_property_types
  end
  def create
    @borrower = Borrower.create(borrower_params)
    @property_types = Borrower.all_property_types
    if @borrower.save
      flash[:notice] = "Congratulations, your loan was approved."
      redirect_to borrower_url(@borrower)
    else
      flash[:error] = "There is an error while creating borrower"
      render :new
    end
  end

  private
  def borrower_params
    params.require(:borrower).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :base_income,
                                    :rental_income,
                                    :commission,
                                    :credit_score,
                                    :address,
                                    :mortage_payment,
                                    :mortage_insurrance,
                                    :homeowner_insurrance,
                                    :property_tax,
                                    :hoa_due,
                                    :property_type
                                    )
  end
end