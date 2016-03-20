Feature: Set up reviewer account
  
    As a Reviewer 
    I want to set up an account
    So that I can start writing reviews
    
Background:
    Given I am on the signup page
    

Scenario: I correctly enter my signup credentials
  
    When I fill in "Email" with "jdoe1@binghamton.edu"
    
    When I fill in "Password" with "abc123"
    
    And I fill in "Confirm" with "abc123"
    
    And I choose "type_reviewer"
    
    And I press "Create Account"
    
    Then I should be on the reviewer page
    
    And I should see "John Doe"
    
Scenario: I leave "user-name-field" empty
  
    When I fill in the following:
    |user-name-field    |                       |
    |user-email-field   | jdoe1@university.edu  |
    |user-password-field| &28*jaAjdsA           |
    |user-password-confirmation-field | &28*jaAjdsA |
     
    And  I check "user-account-box"    
    
    When I press "create-account"
    
    Then I should see "Please fill out the required fields"
    