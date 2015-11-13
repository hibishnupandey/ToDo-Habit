
# features/step_definitions/home_page_steps.rb
Given(/^user visit home page$/) do
  visit root_path
end

Then(/^user should see a message "(.*?)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^user should see the "(.*?)" and "(.*?)"$/) do |signup, signin|
  assert page.has_content?(signup)
  assert page.has_content?(signin)
end