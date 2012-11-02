require 'spec_helper'

describe Country, "model tests" do
fixtures :countries

  before(:each) do
    @country = Country.new
    @country.part_of_the_world_id = "2"    
    @country.country = "Nigeria"
    @country.X_coordinate = "225.090"
    @country.Y_coordinate = "10.100"
    @country.zoom = "5"     
  end

  it { should validate_presence_of :part_of_the_world_id }
  it { should validate_presence_of :country }
  it { should validate_presence_of :X_coordinate }
  it { should validate_presence_of :Y_coordinate }
  it { should validate_presence_of :zoom }
  it { should validate_uniqueness_of :country }
  it { should belong_to :part_of_the_world }
  it { should have_one :capital }

  it "should be valid" do
    @country.should be_valid
  end

  it "should require 'country'" do
  	@country.country = nil
  	@country.should_not be_valid
  	@country.errors.full_message(:country, 'is invalid').should_not be_nil
  end

  it "clears country" do
    countries(:one).destroy
    lambda { countries(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@country.country = "Rabat"
  	@country2 = Country.new(:country => "Tripoli")
    @country3 = Country.new(:country => "Rabat")
    @country.country.should_not eq(@country2.country)
    @country.country.should eq(@country3.country)
  end

 it "check length of 'country'" do 
 	@country.country = "Country"
 	@country.country.should have(7).characters
 	@country.country.should_not have(5).characters
 end

 it "check include content" do
 	@country.country = "Country"
 	@country.country.should include("unt")
 	@country.X_coordinate.should include("90")
 	@country.country.should_not include("tri")
 	@country.Y_coordinate.should_not include("200")
 end
end