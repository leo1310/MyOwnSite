class CreateInterests < ActiveRecord::Migration
   def up
    create_table :interests do |t|
    	t.integer :user_id   
    	t.string :activity_i 	
    	t.string :interests_i    	
    	t.string :favorite_music_i    	
    	t.string :favorite_films_i
    	t.string :favorite_games_i
    	t.string :favorite_books_i
    	t.string :favorite_quotes_i    	
    	t.string :about_yourself_i
      t.timestamps
    end
  end
  def down
  	drop_table :interests
  end
end
