require 'spec_helper'

describe PartOfTheWorld, "model tests" do
fixtures :part_of_the_worlds

  before(:each) do
    @part_of_the_world = PartOfTheWorld.new    
    @part_of_the_world.title = "Australia"
    @part_of_the_world.X_coordinate = "300.000"
    @part_of_the_world.Y_coordinate = "10.000"
    @part_of_the_world.zoom = "4"     
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :X_coordinate }
  it { should validate_presence_of :Y_coordinate }
  it { should validate_presence_of :zoom }
  it { should validate_uniqueness_of :title }
  it { should have_many :countries }
  it { should have_many :capitals }

  it "should be valid" do
    @part_of_the_world.should be_valid
  end

  it "should require name" do
  	@part_of_the_world.title = nil
  	@part_of_the_world.should_not be_valid
  	@part_of_the_world.errors.full_message(:title, 'is invalid').should_not be_nil
  end

  it "clears country" do
    part_of_the_worlds(:one).destroy
    lambda { part_of_the_worlds(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@part_of_the_world.title = "Rabat"
  	@part_of_the_world2 = PartOfTheWorld.new(:title => "Tripoli")
    @part_of_the_world3 = PartOfTheWorld.new(:title => "Rabat")
    @part_of_the_world.title.should_not eq(@part_of_the_world2.title)
    @part_of_the_world.title.should eq(@part_of_the_world3.title)
  end

 it "check length of name" do 
 	@part_of_the_world.title = "PartOfTheWorld"
 	@part_of_the_world.title.should have(14).characters
 	@part_of_the_world.title.should_not have(20).characters
 end

 it "check include content" do
 	@part_of_the_world.title = "PartOfTheWorld"
 	@part_of_the_world.title.should include("Wor")
 	@part_of_the_world.X_coordinate.should include("30")
 	@part_of_the_world.title.should_not include("rtOn")
 	@part_of_the_world.Y_coordinate.should_not include("111")
 end
end