Feature: Admin can merge two articles that have the same topic and say similar things
 
  As an admin
  So that I can remove duplicated articles
  I want to merge both articles together into one article
 
Background: users and articles have been added to database

  Given the blog is set up
  Given the following users exist
  | profile_id | login | name  | password | email          | state  |
  |          2 | user1 | User1 |   123456 | user1@test.com | active |
  |          3 | user2 | User2 |   123456 | user2@test.com | active |
  And the following articles exist
  | id | title    | author | user_id | body     | allow_comments | published | published_at        | state     | type    |
  |  3 | Article1 | user1  |       2 | Content1 | true           | true      | 2013-08-17 10:30:00 | published | Article |
  |  4 | Article2 | user2  |       3 | Content2 | true           | true      | 2013-08-17 11:00:00 | published | Article |

Scenario: A non-admin cannot merge two articles (sad path)
 
  Given I am logged in as "user1" with password "123456"
  And I am on the Edit page of article "3"
  Then I should not see "Merge Articles"


Scenario: The merged articles should contain the text of both previous articles
  Given I have merged article "3" with "4"
  And I am on the Edit page of article "5"
  Then I should see "Content1"
  And I should see "Content2"
