class Payment < ActiveRecord::Base

  attr_accessible :amount, :description, :email, :frequency, :paid, :user_id
  belongs_to :user

  validates :email, :presence => true, :format => { :with => /.+@.+\..+/i }
  validates :amount, :presence => true, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0}
  validates :description, :presence => true, :length => { :maximum => 40 }
end
