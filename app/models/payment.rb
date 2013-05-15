require 'valid_email'

class Payment < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :amount, :description, :email, :frequency, :paid
  belongs_to :user

  validates :email, :presence => true, :email => true
  validates :amount, :presence => true, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 100000}
  validates :description, :presence => true
end
