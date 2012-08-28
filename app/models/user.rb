class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :last_name, :phone, :nik_name
  # attr_accessible :title, :body

  validates :name, :last_name, :phone, :presence => true  
  validates :phone, :numericality => true
  validates :nik_name, :uniqueness => true

  has_many :messages
end