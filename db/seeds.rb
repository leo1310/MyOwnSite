require 'rubygems'
require 'roo'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "------------------------------"
puts "- Start work of file seed.rb -"
puts "------------------------------"

puts " Start add 'Part Of The World' objects to Database"

#----- Opening Or Creating Errors.txt file for write information about errors
file_errors = File.open("tmp/errors.txt", 'w+')

#----- Get Array Name Of Files
array_file_names = Dir.glob("public/information_about_world/*.xls")

#---- The Main Cycle
array_file_names.count.times{

}

file_errors.close

if array_file_names.count > 1
	puts "All Information About World Were Added From "+ array_file_names.count.to_s + " files."
elsif array_file_names.count == 1
	puts "All Information About World Were Added From "+ array_file_names.count.to_s + " file."
elsif array_file_names.count == 0
	puts "None file do not was found for to add information about the world."
end

puts "----------------------------"
puts "- End work of file seed.rb -"
puts "----------------------------"

