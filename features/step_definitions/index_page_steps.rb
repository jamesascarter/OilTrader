Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Given(/^I enter a name$/) do
  fill_in 'name', with: 'James'
end

When(/^I click the button$/) do
  click_button 'Play'
end

Then(/^I should redirect to trader page$/) do
  visit '/trader'
end



