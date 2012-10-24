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

puts " Start add Information to Database"

#----- Opening Or Creating Errors.txt file for write information about errors
file_errors = File.open("tmp/errors.txt", 'w+')

#----- Get Array Name Of Files
array_file_names = Dir.glob("public/information_about_world/*.xls")

#---- The Main Cycle
i = 0
part_of_the_world = PartOfTheWorld.new
country = Country.new
array_file_names.count.times{
	file_errors.write "File --> "+array_file_names[i]+"\r\n\r\n"
	
	file_xls = Excel.new(array_file_names[i])
	file_xls.default_sheet = file_xls.sheets.first
	2.upto(file_xls.last_row) do |line|		
		unless file_xls.cell(line, 1).nil?
			if not file_xls.cell(line, 5).nil? and not file_xls.cell(line, 6).nil? and not file_xls.cell(line, 7).nil? and not file_xls.cell(line, 8).nil?
				PartOfTheWorld.create(title: file_xls.cell(line, 1), description: file_xls.cell(line, 5), X_coordinate: file_xls.cell(line, 6), Y_coordinate: file_xls.cell(line, 7), zoom: file_xls.cell(line, 8))
				part_of_the_world = PartOfTheWorld.find_by_title(file_xls.cell(line, 1))
			else
				file_errors.write " row --> "+line.to_s+"has errors!\r\n"
				next
			end
		end
		
		unless file_xls.cell(line, 2).nil?
			if not file_xls.cell(line, 5).nil? and not file_xls.cell(line, 6).nil? and not file_xls.cell(line, 7).nil? and not file_xls.cell(line, 8).nil?
				Country.create(part_of_the_world_id: part_of_the_world.id, country: file_xls.cell(line, 2), description: file_xls.cell(line, 5), X_coordinate: file_xls.cell(line, 6), Y_coordinate: file_xls.cell(line, 7), zoom: file_xls.cell(line, 8))
				country = Country.find_by_country(file_xls.cell(line, 2))
			else
				file_errors.write " row --> "+line.to_s+"has errors!\r\n"
				next
			end
		end

		unless file_xls.cell(line, 3).nil?
			if not file_xls.cell(line, 5).nil? and not file_xls.cell(line, 6).nil? and not file_xls.cell(line, 7).nil? and not file_xls.cell(line, 8).nil?
				Capital.create(part_of_the_world_id: part_of_the_world.id, country_id: country.id, name: file_xls.cell(line, 3), description: file_xls.cell(line, 5), X_coordinate: file_xls.cell(line, 6), Y_coordinate: file_xls.cell(line, 7), zoom: file_xls.cell(line, 8))			
			else
				file_errors.write " row --> "+line.to_s+"has errors!\r\n"
				next
			end
		end
	end
	i +=1
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

