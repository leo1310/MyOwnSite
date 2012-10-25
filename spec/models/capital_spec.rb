require 'spec_helper'

describe Capital, "model tests" do
fixtures :capitals

  before(:each) do
    @capital = Capital.new
    @capital.part_of_the_world_id = "1"
    @capital.country_id = "2"
    @capital.name = "Kair"
    @capital.X_coordinate = "255.000"
    @capital.Y_coordinate = "15.000"
    @capital.zoom = "8"     
  end
  it { should validate_presence_of :part_of_the_world_id }
  it { should validate_presence_of :country_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :X_coordinate }
  it { should validate_presence_of :Y_coordinate }
  it { should validate_presence_of :zoom }
  it { should validate_uniqueness_of :name }
  it { should belong_to :part_of_the_world }

  it "should be valid" do
    @capital.should be_valid
  end

  it "should require name" do
  	@capital.name = nil
  	@capital.should_not be_valid
  	@capital.errors.full_message(:name, 'is invalid').should_not be_nil
  end

  it "clears capital" do
    capitals(:one).destroy
    lambda { capitals(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@capital.name = "Rabat"
  	@capital2 = Capital.new(:name => "Tripoli")
    @capital3 = Capital.new(:name => "Rabat")
    @capital.name.should_not eq(@capital2.name)
    @capital.name.should eq(@capital3.name)
  end

 it "check length of name" do 
 	@capital.name = "Capital"
 	@capital.name.should have(7).characters
 	@capital.name.should_not have(9).characters
 end

 it "check include content" do
 	@capital.name = "Capital"
 	@capital.name.should include("ital")
 	@capital.X_coordinate.should include("000")
 	@capital.name.should_not include("aaaa")
 	@capital.Y_coordinate.should_not include("010")
 end
end