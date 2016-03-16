Feature: Set up reviewer account
  
    As a Reviewer 
    I want to set up an account
    So that I can start writing reviews
    
Background:
    Given: I am on the homepage 
    
    When: I press "sign-up"
    
    Then: I should be on the sign-up page

Scenario:
    
    When I fill in "user-name-field" with "John Doe"
    
    And I fill in "user-email-field" with "jdoe1@university.edu"
    
    And I fill in "user-password-field" with "&28*jaAjdsA"
    
    And I fill in "user-password-confirmation-field" with "&28*jaAjdsA"
    
    And I check "user-account-box"
    
    And I click "create-account"
    
    Then I should be on the reviewer page
    
    And The "Reviewers" table should contain 
    |name        |email                 |password      
    |John Doe    |jdoe1@university.edu  |&28*jaAjdsA
    