@javascript
@wip
Feature: Test Messaging in main menu
  Scenario: Test message menu
    Given I am a logged in Site
    Then I click link "Message"
    And I see Message menu is active
    And I should see "Надіслати"
    And I should see "Вхідні"
    And I should see "Надіслані"
    And I should see "Надіслати нове повідомлення"
    Then I fill the message form with who get "maria" subject "Hello" and description "Hi Maria. How are you?" values    
    And I click on the send new message button
	And I should see "Error sending. No such nick."
	Then I fill the message form with who get "Test_User" subject "Hello" and description "Hi Leo. How are you?" values
	And I click on the send new message button
	And I should see "Your message sent to the recipient."
	Then I click link "Надіслані"	
	And I should see "Ваші вихідні повідомлення"
	And I should see "Displaying 1 Message"
	And I should see "Кому"
	And I should see "Заголовок"
	And I should see "Дата"
	And I should see "Test_User"
	And I should not see "Test_User2"
	And I should see "Hello"
	Then I click link "Вхідні"	
	And I should see "Displaying 1 Message"
	And I should see "Ваші вхідні повідомлення"
	And I should see "У вас нових повідомлень: 1"
	And I should see new message
	Then I click message
	And I should see "Текст повідомлення:"
	And I should see "Hi Leo. How are you?"
	Then I click message
	And I should not see new message	

