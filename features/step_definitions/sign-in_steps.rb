Given /^a valid user$/ do
  @user = User.create!({
             :email => "test@hotmail.com",
             :password => "welcome1",
             :password_confirmation => "welcome1"
           })
end

And /^visitor is on the home page$/ do
  visit root_path
end

When /^visitor click on link "(.*?)"$/ do |url|
  click_link(url)
end

And /^visitor fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  assert fill_in(field.gsub(' ', '_'), :with => value)
end

When /^visitor click the "(.*?)" button$/ do |button|
  click_button(button)
end

Then /^visitor should be redirected to the dashboard page$/ do
  assert(page.current_path) == "/dashboard"
end

And /^visitor see message "(.*?)"$/ do |message|
  assert page.has_content?(message)
end
