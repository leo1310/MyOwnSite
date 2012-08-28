class Message < ActiveRecord::Base
   attr_accessible :who_send_mail, :who_get_mail, :subject, :description, :read_message

   validates :who_send_mail, :who_get_mail, :presence => true
   
   belongs_to :user

   
end
