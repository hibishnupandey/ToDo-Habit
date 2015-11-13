Given /^I am logged in as a normal user$/ do
  @user = User.create!({
             :email => "test@hotmail.com",
             :password => "welcome1",
             :password_confirmation => "welcome1"
           })
  visit root_path
  click_link("Sign In")
  assert fill_in("user_email", :with => "test@hotmail.com")
  assert fill_in("user_password", :with => "welcome1")
  click_button("Sign in")
  assert(page.current_path) == "/dashboard"
end

#Scenario: To do list

Given /^I have tasks titled (.+)$/ do |descs|
  descs.split(', ').each do |desc|
    assert Item.create!(:description => desc, :due_date => Date.tomorrow.strftime("%F").to_str, :user_id=> @user.id)
  end
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
  assert page.has_content?("My ToDos")
end

Then /^I can see "(.*?)"$/ do |message|
  assert page.has_content?(message)
end

#Scenario: Add to do items
 Given /^I am on the (.+)$/ do |page_name|
  visit path_to(page_name)
  assert page.has_content?("My ToDos")
 end

  When /^I click on link "(.*?)"$/ do |url|
    click_link(url)
    assert page.has_content?("Add New ToDo Item")
  end

  And /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
      value = Date.tomorrow.strftime("%F").to_str if value == "Tomorrow"
      assert fill_in(field.gsub(' ', '_'), :with => value)
  end

  When /^I click the "(.*?)" button$/ do |button|
    click_button(button)
  end

  Then /^I should see message "(.*?)"$/ do |message|
    assert page.has_content?(message)
  end

  When /^I visit (.+)$/ do |page_name|
    visit path_to(page_name)
    assert page.has_content?("My ToDos")
  end

  Then /^the task list shows "(.*?)"$/ do |message|
    assert page.has_content?(message)
  end

#Scenario: Edit to do item

  And /^there is a task description (.+)$/ do |desc|
     assert Item.create!(:description => desc, :due_date => Date.tomorrow.strftime("%F").to_str, :user_id=> @user.id)
  end

  When /^I (.+) the "([^\"]*)" to "([^\"]*)"$/ do |button, field, value|
    visit(item_path(Item.first))
    assert page.has_content?("Edit")
    click_link "Edit"
    assert fill_in(field.gsub(' ', '_'), :with => value)
    click_button(button)
  end

  Then /^I expect message "([^\"]*)"$/ do |message|
    assert page.has_content?(message)
  end
