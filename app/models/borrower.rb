class Borrower < ActiveRecord::Base
  enum all_property_type: ['single family', 'duplex', 'triplex', '4-plex', 'condo', 'others']
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :property_type
  validates_numericality_of :base_income, greater_than: 0
  validates_numericality_of :rental_income, greater_than_or_equal_to: 0
  validates_numericality_of :credit_score, less_than_or_equal_to: 620, message: "Sorry, your credit score is below the minimum required to obtain a mortgage."
  validate :proper_type_should_be_in_allowed_list
  validate :should_have_accepted_housing_expense_ratio

  def proper_type_should_be_in_allowed_list
    return if property_type.blank?
    all_property_types = Borrower.all_property_types
    accepted_property_types = all_property_types.except('others')
    if property_type == Borrower.all_property_types['others']
      errors.add(:property_type, 'Sorry, your subject property is not eligible. We only offer loan programs for residential 1-4 units at this time')
    end
  end
  def should_have_accepted_housing_expense_ratio
    total_income = base_income + rental_income + commission
    housing_expense = mortage_payment + mortage_insurrance + property_tax
    housing_expense += homeowner_insurrance if homeowner_insurrance.present?
    housing_expense += hoa_due if hoa_due.present?

    housing_expense_ratio = housing_expense/total_income

    if housing_expense_ratio > 0.28
      errors.add(:housing_expense_ratio, "Your current housing expense is currently too high. We can't find any loan programs for you.")
    end
  end
end