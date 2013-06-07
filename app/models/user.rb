class User < ActiveRecord::Base
  # Include default devise modules. Others available are:

  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :not_registered
  # attr_accessible :title, :body
  has_many :payments
end
