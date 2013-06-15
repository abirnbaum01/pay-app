class User < ActiveRecord::Base
  # Include default devise modules. Others available are:

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
  :remember_me, :not_registered, :pay_method, :pay_desc, :email_instructions
  # attr_accessible :title, :body
  has_many :payments

  validates :pay_method, :presence => true
  validates :pay_desc, :presence => true

  # bypasses Devise's requirement to re-enter current password to edit ... BUT THIS ALSO REMOVES THE NEED TO PUT IN CURRENT PASSWORD ALWAYS.  SO NEED TO FIX
  def update_with_password(params={})   
	if params[:password].blank? 
		params.delete(:current_password) 
	  	update_attributes(params) 
  	else
  		super
  	end
  end
end