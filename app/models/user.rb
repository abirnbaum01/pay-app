class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
  :remember_me, :not_registered, :pay_method, :pay_desc, :email_instructions, :current_password

  has_many :payments

  validates :password, :length => { :minimum => 4 }
  validates :password_confirmation, :length => { :minimum => 4 }

  #override this devise function to skip current_password validation if user is not registered
  def update_with_password(params={})

    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if has_no_password?  || valid_password?(current_password)
      if has_no_password?
        params[:not_registered] = "0"
      end
      update_attributes(params)
    else
      self.assign_attributes(params)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)

      #self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      #self.attributes = params
      false
    end

    clean_up_passwords
    result
  end

  # if current_user not registered, they will have no password and this will evaluate to true
  def has_no_password?
    self.encrypted_password.blank?
  end

end