class Contact < ActiveRecord::Base
   attr_accessible :user_id, :skype_c, :icq_c, :twitter_c, :facebook_c, :google_plus_c, :vkontakte_c, :email_c


   belongs_to :user
end


