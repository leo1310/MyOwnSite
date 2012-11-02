require 'spec_helper'

describe Message, "model tests" do
fixtures :messages

  before(:each) do
    @message = Message.new
    @message.who_send_mail = "Nike"    
    @message.who_get_mail = "Addidas"
    @message.subject = "Celebration"
    @message.description = "Are you will be in party?"
    @message.read_message = "not_read"     
  end

  it { should validate_presence_of :who_send_mail }
  it { should validate_presence_of :who_get_mail }
  it { should belong_to :user }  

  it "should be valid" do
    @message.should be_valid
  end

  it "should require who_send_mail" do
  	@message.who_send_mail = nil
  	@message.should_not be_valid
  	@message.errors.full_message(:who_send_mail, 'is invalid').should_not be_nil
  end

  it "clears country" do
    messages(:one).destroy
    lambda { messages(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@message.who_send_mail = "Robert"
  	@message2 = Message.new(:who_send_mail => "Tresh")
    @message3 = Message.new(:who_send_mail => "Robert")
    @message.who_send_mail.should_not eq(@message2.who_send_mail)
    @message.who_send_mail.should eq(@message3.who_send_mail)
  end

 it "check length of 'who_get_mail'" do 
 	@message.who_get_mail = "Maria_mirabella"
 	@message.who_get_mail.should have(15).characters
 	@message.who_get_mail.should_not have(21).characters
 end

 it "check include content" do
 	@message.who_send_mail = "Oleg"
 	@message.who_send_mail.should include("eg")
 	@message.who_get_mail.should include("ddi")
 	@message.who_get_mail.should_not include("bba")
 	@message.subject.should_not include("celet")
 end
end