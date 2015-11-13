
# features/step_definitions/home_page_steps.rb
Given(/^user is on the home page$/) do
  visit root_path
end

Then(/^user can see a link "(.*?)"$/) do |content|
  assert page.has_link?(content)
end

When /^user click on link "(.*?)"$/ do |url|
  click_link(url)
end

And /^user fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  assert fill_in(field.gsub(' ', '_'), :with => value)
end

And /^user click the "(.*?)" button$/ do |button|
  click_button(button)
end

Then /^user should be redirected to the dashboard page$/ do
  assert(page.current_path) == "/dashboard"
end

And /^user see message "(.*?)"$/ do |message|
  assert page.has_content?(message)
end
