require 'spec_helper'

describe Hymn, "model tests" do
  fixtures :hymns
  
  before(:each) do
    @hymn = Hymn.new    
    @hymn.country_id = "2"
    @hymn.content_type = "audio/mp3"
    @hymn.filename = "MySoung"    
  end

  it { should validate_presence_of :country_id }  
  it { should validate_uniqueness_of :country_id }

  it "should be valid" do
    @hymn.should be_valid
  end

  it "should require country_id" do
  	@hymn.country_id = nil
  	@hymn.should_not be_valid
  	@hymn.errors.full_message(:country_id, 'is invalid').should_not be_nil
  end

  it "clears hymn" do
    hymns(:one).destroy
    lambda { hymns(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@hymn.filename = "MyAlbums"
  	@hymn2 = Hymn.new(:filename => "MyAlbum")
    @hymn3 = Hymn.new(:filename => "MyAlbums")
    @hymn.filename.should_not eq(@hymn2.filename)
    @hymn.filename.should eq(@hymn3.filename)
  end

 it "check length of filename" do 
 	@hymn.filename = "MyAlbums"
 	@hymn.filename.should have(8).characters
 	@hymn.filename.should_not have(7).characters
 end

 it "check include content" do
 	@hymn.filename = "MyAlbums"
 	@hymn.filename.should include("bum")
 	@hymn.content_type.should include("mp3")
 	@hymn.content_type.should_not include("jpeg") 	
 end
end
