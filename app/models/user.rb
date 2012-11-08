class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :last_name, :phone, :nik_name, :avatar, :surname, :birthday, :marital_status, :stat, :native_town, :birthday_show_hide_date, :secondary_educations_attributes, :higher_educations_attributes, :courses_attributes, :trainings_attributes, :careers_attributes


  validates :name, :last_name, :phone, :nik_name, :presence => true  
  validates :phone, :numericality => true
  validates :nik_name, :email, :uniqueness => true
  

  has_many :messages, :order => 'created_at DESC', :dependent => :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300", :big_thumb=>"128x128", :thumb => "64x64", :very_little => "48x48" }
  has_one :contact, :dependent => :destroy
  has_one :interest, :dependent => :destroy
  
  has_many :secondary_educations, :dependent => :destroy
  accepts_nested_attributes_for :secondary_educations, :allow_destroy => true

  has_many :higher_educations, :dependent => :destroy
  accepts_nested_attributes_for :higher_educations, :allow_destroy => true

  has_many :courses, :dependent => :destroy
  accepts_nested_attributes_for :courses, :allow_destroy => true

  has_many :trainings, :dependent => :destroy
  accepts_nested_attributes_for :trainings, :allow_destroy => true

  has_many :careers, :dependent => :destroy
  accepts_nested_attributes_for :careers, :allow_destroy => true

  has_many :friends, :dependent => :destroy
  
end
