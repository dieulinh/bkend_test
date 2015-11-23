class Borrower < ActiveRecord::Base
  enum all_property_type: ['single family', 'duplex', 'triplex', '4-plex', 'condo', 'others']
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :property_type
  validates_numericality_of :base_income, greater_than: 0
  validates_numericality_of :rental_income, greater_than_or_equal_to: 0
  validates_numericality_of :credit_score, less_than_or_equal_to: 620
  validate :proper_type_should_be_in_allowed_list

  def proper_type_should_be_in_allowed_list
    return if property_type.blank?
    all_property_types = Borrower.all_property_types
    accepted_property_types = all_property_types.except('others')
    if property_type == Borrower.all_property_types['others']
      errors.add(:property_type, 'Sorry, your subject property is not eligible. We only offer loan programs for residential 1-4 units at this time')
    end
  end
end