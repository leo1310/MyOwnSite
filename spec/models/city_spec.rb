require 'spec_helper'

describe City, "model tests" do
fixtures :cities

  before(:each) do
    @city = City.new
    @city.part_of_the_world_id = "1"
    @city.country_id = "2"
    @city.city = "Leeds"
    @city.X_coordinate = "255.000"
    @city.Y_coordinate = "15.000"
    @city.zoom = "8"     
  end

  it { should validate_presence_of :part_of_the_world_id }
  it { should validate_presence_of :country_id }
  it { should validate_presence_of :city }
  it { should validate_presence_of :X_coordinate }
  it { should validate_presence_of :Y_coordinate }
  it { should validate_presence_of :zoom }
  it { should validate_uniqueness_of :city }
  it { should belong_to :part_of_the_world }
  it { should belong_to :country }

  it "should be valid" do
    @city.should be_valid
  end

  it "should require 'city'" do
  	@city.city = nil
  	@city.should_not be_valid
  	@city.errors.full_message(:city, 'is invalid').should_not be_nil
  end

  it "clears capital" do
    cities(:one).destroy
    lambda { cities(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@city.city = "Manchester"
  	@city2 = City.new(:city => "Liverpool")
    @city3 = City.new(:city => "Manchester")
    @city.city.should_not eq(@city2.city)
    @city.city.should eq(@city3.city)
  end

 it "check length of 'city'" do 
 	@city.city = "Manchester"
 	@city.city.should have(10).characters
 	@city.city.should_not have(11).characters
 end

 it "check include content" do
 	@city.city = "Manchester"
 	@city.city.should include("cheste")
 	@city.X_coordinate.should include("255")
 	@city.city.should_not include("anhc")
 	@city.Y_coordinate.should_not include("89")
 end
end