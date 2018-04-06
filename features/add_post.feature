Feature: Add new post

	As a user
	I want to be able to submit a post
	So that I can express my thoughts

Scenario: create a new post with empty username 

	Given I am in home page
	And I enter "Hello, World!" in "message"
	And I click "Ipahayag!"
	Then I should see "Hello, World!"
	And I should see "Anonymous"

Scenario: create a new post with non-empty username

	Given I am in home page
	And I enter "!dlroW ,olleH" in "message"
	And I enter "Sumisigaw na ibon" in "user"
	And I click "Ipahayag!"
	Then I should see "!dlroW ,olleH"
	And I should see "Sumisigaw na ibon"
		