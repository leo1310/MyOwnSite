class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :nik_name, :avatar
  # attr_accessible :title, :body

  validates :nik_name, :uniqueness => true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "64x64>" }
end
