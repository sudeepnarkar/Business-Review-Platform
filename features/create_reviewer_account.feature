Feature: Set up reviewer account
  
    As a Reviewer 
    I want to set up an account
    So that I can start writing reviews
    
Background:
    Given I am on the signup page
    

Scenario: I correctly enter my signup credentials
    
    When I fill in the following:
    |user-name-field    | John Doe              |
    |user-email-field   | jdoe1@university.edu  |
    |user-password-field| &28*jaAjdsA           |
    |user-password-confirmation-field | &28*jaAjdsA |
    
    And I check "user-account-box"
    
    And I press "create-account"
    
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
    