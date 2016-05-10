Feature: Login to Reviewer account

    As a Reviewer
    I want to to login to my account
    So that I can start writing reviews

Background:

    Given the following users exist:
    | email                  | password_hash  |password_salt |
    | jdoe1@university.edu   | &28*jaAjdsA    | #!234*       |
 

    And I am on the login page
    
    And I fill in "Email" with "jdoe1@university.edu"
    
    And I fill in "Password_hash" with "&28*jaAjdsA"
    
    And I press "Login"
    
Scenario: when I open the browser window while still signed in 
  
    When I go to the index page
    
    Then I should be on the new review page
    
    
    #Given I didn't log out the last time I was on the site
    
    #When I go to the index page
    
    #Then I should automatically be logged in
    
    
    