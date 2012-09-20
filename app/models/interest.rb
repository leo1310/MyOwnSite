class Interest < ActiveRecord::Base
  attr_accessible :user_id, :activity_i, :interests_i, :favorite_music_i, :favorite_films_i, :favorite_games_i, :favorite_books_i, :favorite_quotes_i, :about_yourself_i, :favorite_sport_i

  belongs_to :user
end
