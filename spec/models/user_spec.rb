require 'spec_helper'

describe User, "model tests" do
fixtures :users

  before(:each) do
    @user = User.new    
    @user.name = "Oleg"
    @user.last_name = "Procyk"
    @user.phone = "+380985656564"
    @user.email = "oleg_procyk@gmail.com"     
    @user.nik_name = "nik_name100"     
    @user.password = "1234567"
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :nik_name }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :nik_name }
  it { should validate_numericality_of :phone }
  it { should have_many :messages }
  it { should have_many :secondary_educations }
  it { should have_many :higher_educations }
  it { should have_many :courses }
  it { should have_many :trainings }
  it { should have_many :careers }
  it { should have_many :friends }


  it "should be valid" do
    @user.should be_valid
  end

  it "should require name" do
  	@user.name = nil
  	@user.should_not be_valid
  	@user.errors.full_message(:name, 'is invalid').should_not be_nil
  end

  it "clears country" do
    users(:one).destroy
    lambda { users(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@user.name = "Leonel"
  	@user2 = User.new(:name => "Tripoli")
    @user3 = User.new(:name => "Leonel")
    @user.name.should_not eq(@user2.name)
    @user.name.should eq(@user3.name)
  end

 it "check length of name" do 
 	@user.name = "UserName"
  @user.last_name = "UserLastName"
 	@user.name.should have(8).characters
  @user.last_name.should have(12).characters
 	@user.name.should_not have(10).characters
  @user.last_name.should_not have(13).characters
 end

 it "check include content" do
 	@user.name = "MyNameIs"
 	@user.name.should include("meI")
 	@user.last_name.should include("cyk")
 	@user.last_name.should_not include("guu")
 	@user.nik_name.should_not include("kok")
  @user.nik_name.should include("e100")
 end
end