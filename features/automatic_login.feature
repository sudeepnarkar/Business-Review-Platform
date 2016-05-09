Feature: Login to Reviewer account

    As a Reviewer
    I want to to login to my account
    So that I can start writing reviews

Background:

    Given the following users exist:
    | email                  | password_hash  |password_salt |
    | jdoe1@university.edu   | &28*jaAjdsA    | #!234*       |
 
    
Scenario: when I open the browser window while still signed in 
  
    Given I didn't log out the last time I was on the site
    
    When I go to the index page
    
    Then I should automatically be logged in
    
    
    