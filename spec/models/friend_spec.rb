require 'spec_helper'

describe Friend, "model tests" do
fixtures :friends

  before(:each) do
    @friend = Friend.new
    @friend.user_id = "1"
    @friend.friend = "7"
    @friend.query_to_friends = "0"
        
  end
  it { should validate_uniqueness_of(:friend).scoped_to(:user_id) }
  it { should belong_to :user }

  it "should be valid" do
    @friend.should be_valid
  end

  it "should require friend" do
  	@friend2 = Friend.create!(:friend => "7", :user_id=>"1")
    @friend3 = Friend.new(:friend => "7", :user_id=>"1")
  	@friend3.should_not be_valid
  	@friend3.errors.full_message(:friend, 'is invalid').should_not be_nil
  end

  it "clears capital" do
    friends(:one).destroy
    lambda { friends(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@friend.friend = "8"
  	@friend2 = Friend.new(:friend => "3")
    @friend3 = Friend.new(:friend => "8", :user_id=> "2")
    @friend.friend.should_not eq(@friend2.friend)
    @friend.friend.should eq(@friend3.friend)
  end
 
end