class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :last_name, :phone, :nik_name, :avatar, :surname, :birthday, :marital_status, :stat, :native_town, :birthday_show_hide_date, :secondary_educations_attributes, :higher_educations_attributes, :courses_attributes, :trainings_attributes, :careers_attributes


  validates :name, :last_name, :phone, :presence => true  
  validates :phone, :numericality => true
  validates :nik_name, :email, :uniqueness => true
  

  has_many :messages, :order => 'created_at DESC'
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "64x64>" }
  has_one :contact, :dependent => :destroy
  has_one :interest, :dependent => :destroy
  
  has_many :secondary_educations
  accepts_nested_attributes_for :secondary_educations, :allow_destroy => true

  has_many :higher_educations
  accepts_nested_attributes_for :higher_educations, :allow_destroy => true

  has_many :courses
  accepts_nested_attributes_for :courses, :allow_destroy => true

  has_many :trainings
  accepts_nested_attributes_for :trainings, :allow_destroy => true

  has_many :careers
  accepts_nested_attributes_for :careers, :allow_destroy => true
  
end
