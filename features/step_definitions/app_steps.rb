When /^I enter "(.*)" in "(.*)"$/ do |text, field|			
	fill_in(field, with: text, visible: false)	
end

When /^I click "(.*)"$/ do |button|	
	click_button(button)
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|	
	page.has_content?(text)	
end

Given("I am in home page") do
	visit '/'
end