Feature: Login to Reviewer account

    As a Reviewer
    I want to to login to my account
    So that I can start writing reviews

Background:

    Given the following users exist:
    | email                  | password_hash  |password_salt |
    | jdoe1@university.edu   | &28*jaAjdsA    | #!234*       |
 
    Given I am on the login page

Scenario: I correctly enters my login credentials
  
    When I fill in "Email" with "jdoe1@university.edu"
    
    When I fill in "Password_hash" with "&28*jaAjdsA"
    
    And I press "Login"
    
<<<<<<< HEAD
    Then I should see the reviewer page for jdoe1@university.edu
=======
    Then I should be on the reviewer page for jdoe1@university.edu
>>>>>>> e89b79d647f612eefb4d88f3d660722c9e0fb2f0
    
    And I should see "jdoe1@university.edu"

Scenario:I enter incorrect credentials
    
    When I fill in "Email" with "incorrect@university.edu"
    
    When I fill in "Password_hash" with "incorrect_password"
    
    And I press "Login"
    
    Then show me the login page

Scenario: I leave "user-email-field" and "user-password-field" empty
    
    When I fill in "Email" with " "
    
    When I fill in "Password_hash" with " "
    
    And I press "Login"
    
    Then show me the login page
    