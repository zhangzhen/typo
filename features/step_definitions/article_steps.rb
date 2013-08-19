Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /I am logged in as "(.*)" with password "(.*)"/ do |login, pwd|
  steps %Q{
    Given I am on the Login page
    When  I fill in "user_login" with "#{login}"
    And   I fill in "user_password" with "#{pwd}"
    And   I press "Login"
    Then  I should see "Login successful"
  }
end

Given /I have merged article "(.*)" with "(.*)"/ do |id1, id2|
  steps %Q{
    Given I am logged into the admin panel
    And I am on the Edit page of article "#{id1}"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "#{id2}"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles were merged successfully"
  }
end
