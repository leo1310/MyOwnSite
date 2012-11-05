# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121105152357) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nik_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "album_fotos", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "capitals", :force => true do |t|
    t.integer  "part_of_the_world_id"
    t.integer  "country_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "X_coordinate"
    t.string   "Y_coordinate"
    t.integer  "zoom"
  end

  create_table "careers", :force => true do |t|
    t.integer  "user_id"
    t.string   "country"
    t.string   "town"
    t.string   "name_work"
    t.date     "start_year"
    t.date     "end_year"
    t.string   "position"
    t.string   "obligations"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cities", :force => true do |t|
    t.integer  "part_of_the_world_id"
    t.integer  "country_id"
    t.string   "city"
    t.text     "description"
    t.string   "X_coordinate"
    t.string   "Y_coordinate"
    t.integer  "zoom"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "skype_c"
    t.string   "icq_c"
    t.string   "twitter_c"
    t.string   "facebook_c"
    t.string   "google_plus_c"
    t.string   "vkontakte_c"
    t.string   "email_c"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "country"
    t.string   "town"
    t.string   "house"
    t.string   "own_site"
  end

  create_table "countries", :force => true do |t|
    t.integer  "part_of_the_world_id"
    t.string   "country"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "X_coordinate"
    t.string   "Y_coordinate"
    t.integer  "zoom"
  end

  create_table "country_informations", :force => true do |t|
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.integer  "user_id"
    t.string   "country"
    t.string   "town"
    t.string   "name_course"
    t.date     "year"
    t.string   "description"
    t.string   "narrator_course"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.date     "year_end"
    t.string   "name_institution"
  end

  create_table "fotos", :force => true do |t|
    t.integer  "album_foto_id"
    t.text     "description"
    t.string   "content_type"
    t.string   "filename"
    t.binary   "binary_data",   :limit => 16777215
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "query_to_friends"
  end

  create_table "higher_educations", :force => true do |t|
    t.integer  "user_id"
    t.string   "country"
    t.string   "town"
    t.string   "high_school"
    t.string   "faculty"
    t.string   "department"
    t.string   "status"
    t.date     "start_year"
    t.date     "end_year"
    t.string   "specialization"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "hymns", :force => true do |t|
    t.integer  "country_id"
    t.string   "content_type"
    t.string   "filename"
    t.binary   "binary_data",  :limit => 16777215
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "interests", :force => true do |t|
    t.integer  "user_id"
    t.string   "activity_i"
    t.string   "interests_i"
    t.string   "favorite_music_i"
    t.string   "favorite_films_i"
    t.string   "favorite_games_i"
    t.string   "favorite_books_i"
    t.string   "favorite_quotes_i"
    t.string   "about_yourself_i"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "favorite_sport_i"
  end

  create_table "messages", :force => true do |t|
    t.string   "who_send_mail"
    t.string   "who_get_mail"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "user_id"
    t.string   "read_message"
    t.string   "deleted_sender", :default => "true"
    t.string   "deleted_geter",  :default => "true"
    t.integer  "spam"
  end

  create_table "part_of_the_worlds", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "X_coordinate"
    t.string   "Y_coordinate"
    t.integer  "zoom"
  end

  create_table "secondary_educations", :force => true do |t|
    t.integer  "user_id"
    t.string   "country"
    t.string   "town"
    t.string   "school"
    t.date     "start_year"
    t.date     "end_year"
    t.string   "specialization"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spam_words", :force => true do |t|
    t.string   "word"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trainings", :force => true do |t|
    t.integer  "user_id"
    t.string   "country"
    t.string   "town"
    t.string   "name_institution"
    t.string   "name_training"
    t.date     "year"
    t.string   "description"
    t.string   "narrator_course"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                   :default => "", :null => false
    t.string   "encrypted_password",      :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "nik_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "surname"
    t.date     "birthday"
    t.string   "marital_status"
    t.string   "stat"
    t.string   "native_town"
    t.string   "birthday_show_hide_date"
    t.datetime "time_logout"
    t.integer  "count_time_logout",       :default => 0
    t.datetime "status_active"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
