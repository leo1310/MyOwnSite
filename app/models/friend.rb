class Friend < ActiveRecord::Base
  attr_accessible :user_id, :friend, :query_to_friends

  belongs_to :user

  validates :friend, :uniqueness => {:scope => :user_id}
end
