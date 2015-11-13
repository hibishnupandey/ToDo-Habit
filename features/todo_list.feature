Feature: Todo item management

   Background:
    Given I am logged in as a normal user

   Scenario: To do list
     Given I have tasks titled TaskABC, TaskDEF
     When I go to the dashboard page
     Then I can see "TaskABC"
     And I can see "TaskDEF"

   Scenario: Add to do item
     Given I am on the dashboard page
     When I click on link "Add new"
     And I fill in "item description" with "My First Task"
     And I fill in "item due date" with "Tomorrow"
     When I click the "Create" button
     Then I should see message "To-do item added!"
     When I visit the dashboard page
     Then the task list shows "My First Task"

   Scenario: Edit to do item
     Given I am on the dashboard page
     And there is a task description "My Second Task"
     When I Update the "item description" to "My Next Task"
     Then I expect message "Item was successfully updated."

@wip
   Scenario: Edit to do item
     When I edit task
     Then I should see task updated message
     When I go to the dashboard page
     Then I can not see the completed task
     When I go to to do index page
     Then I can see the completed task

     Then I should see "Item was successfully updated."