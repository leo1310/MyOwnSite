@javascript
Feature: First visit on site how user
  Scenario: Test index page
    Given I am a logged in Site
    And I should see "Home"
    And I should see "Profile"
    And I should see "Search"
    And I should not see "My Page"
    And I should see "Setting"
    And I should see "Message"
    And I should see "About Us"
    And I should see "Help"
    And I should see "Logout"
    And I should see "Copyright © 2012 Lviv LEO Corporation. All Rights Reserved. Информация для контактов: leo1021@mail.ru. Правила использования материалов сайта."
    When I click link "About Us"
    And I should see "Advertisement"
    And I should see "About Site"
    And I should see "Our Partners"
    And I should see "Authors"
    And I should see "Contacts"
    And I should see "Additional Information"
    Then I click link "Help"
	And I should see "Help"
	And I should see "Tutorial1"
	Then I click link "Profile"
	And I should see "Test User"
	And I should see "Online"
	Then I click link "Message"
	And I should see "Надіслати нове повідомлення"	
	Then I fill the message form with who get "maria" subject "Hello" and description "Hi Maria. How are you?" values
	And I click on the send new message button
	And I should see "Error sending. No such nick."
	Then I fill the message form with who get "Test_User" subject "Hello" and description "Hi Leo. How are you?" values
	And I click on the send new message button
	And I should see "Your message sent to the recipient."
	Then I click link "Profile"
	And I should see "Повідомлення"
	Then I click link "Повідомлення"
	And I should see "Displaying 1 Message"
	Then I click link "Home"
	Then I click link "africa"
	And I should see "Країни"
	And I should see "Столиці"
	Then I select on the country form row with name "Nigeria"
	And I should see "Nigeria it is ..."
	Then I select on the capital form row with name "Alger"
	And I should see "The City Alger is the capital of Alger ..."