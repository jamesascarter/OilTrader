Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
  save_and_open_page
  expect(page).to have_content(text)
end

