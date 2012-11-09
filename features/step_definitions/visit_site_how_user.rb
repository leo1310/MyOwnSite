Given /^I am a logged in Site$/ do
  email = 'test.example@test.com'
  password = '123456'  
  name = 'Test'
  last_name = 'User'
  phone = '+380991234567'
  nik_name = 'Test_User'
  User.create!(email: email, password: password, name: name, last_name: last_name, phone: phone, nik_name: nik_name)
  PartOfTheWorld.create!(id: 1, title: "Africa", description: "Africa it is...", X_coordinate: 390.000, Y_coordinate: 5.000, zoom: 4)
  Country.create!(id: 1, part_of_the_world_id: 1, country: "Algeria", description: "Algeria it is ...", X_coordinate: 363.000, Y_coordinate: 25.000, zoom: 5)
  Country.create!(id: 2, part_of_the_world_id: 1, country: "Nigeria", description: "Nigeria it is ...", X_coordinate: 368.000, Y_coordinate: 10.000, zoom: 5)
  Capital.create!(part_of_the_world_id: 1, country_id: 1, name: "Alger", description: "The City Alger is the capital of Alger ...", X_coordinate: 363.030, Y_coordinate: 36.740, zoom: 5)
  Capital.create!(part_of_the_world_id: 1, country_id: 2, name: "Abuja", description: "The City Abuja is the capital of Nigeria  ...", X_coordinate: 367.485, Y_coordinate: 9.065, zoom:6)

  visit '/useraut/login'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end

And /^I should see "([^"]*)"$/ do |value|
  assert page.has_content?(value)
end

And /^I should not see "([^"]*)"$/ do |value|
  assert page.has_no_content?(value)
end

Given /^I fill the message form with who get "(.*?)" subject "(.*?)" and description "(.*?)" values$/ do |value1, value2, value3|   
  within('#new_message') do
  	fill_in("message_who_get_mail", :with => value1)
  	fill_in("message_subject", :with => value2)
  	fill_in("message_description", :with => value3)
  end    	 
end

Given /^I click on the send new message button$/ do
  find('#send_message').click  
end

When /^I select on the country form row with name "(.*?)"$/ do |name|	
  page.find('#country').find('option', :text => name).click
end

When /^I select on the capital form row with name "(.*?)"$/ do |name|	
  find('#capital').find('option', :text => name).click
end

When /^I click link "([^"]*)"$/ do |link|
  click_link link
end

