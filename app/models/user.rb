class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
  :remember_me, :not_registered, :pay_method, :pay_desc, :email_instructions, :current_password

  has_many :payments

  #validates :password, :length => { :minimum => 4 }
  #validates :password_confirmation, :length => { :minimum => 4 }

  #override this devise function to skip current_password validation if user is not registered
  def update_with_password(params={})
    current_password = params.delete(:current_password)

    if params[:password].blank?
      puts "*********** params password was blank"
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    puts "self is as follows:"
    puts self.encrypted_password
    puts "current password is as follows:"
    puts current_password
    puts "params is as follows:"
    puts params

    if has_no_password?
      puts "************ has no password"
    end
    if valid_password?(current_password)
      puts "************ current password is valid"
    end

    result = if has_no_password?  || valid_password?(current_password)
      puts "***********  result was true"
      update_attributes(params)
    else
      puts "*********** result was false"
      self.assign_attributes(params)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
    
    #if !has_no_password? && params[:not_registered] == "1"     #don't want to do this here, because have not yet verified password was set
      #params[:not_registered] = "0"
     # params.update_attribute(:not_registered, "0")
      #puts "not_registered updated **********"
    #end
    clean_up_passwords
    
    puts "*********** got to end of loop"
    result
  end

  # if current_user not registered, they will have no password and this will evaluate to true
  def has_no_password?
    self.encrypted_password.blank?
  end

end