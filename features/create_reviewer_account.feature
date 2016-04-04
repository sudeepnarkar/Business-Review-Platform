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
    
    Then I should be on the reviewer page for jdoe1@binghamton.edu
    
Scenario: I leave "Email" empty
  
    When I fill in "Email" with ""
    
    When I fill in "Password" with "abc123"
    
    And I fill in "Confirm" with "abc123"
     
    And I choose "type_reviewer"  
    
    When I press "Create Account"
    
    Then I should be on the signup page
    
Scenario: I leave "Password" empty
  
    When I fill in "Email" with "jdoe1"
    
    When I fill in "Password" with ""
    
    And I fill in "Confirm" with "abc123"
     
    And I choose "type_reviewer"  
    
    When I press "Create Account"
    
    Then I should be on the signup page
    
Scenario: I password and confirmation don't match
  
    When I fill in "Email" with "jdoe1"
    
    When I fill in "Password" with "abb123"
    
    And I fill in "Confirm" with "abc123"
     
    And I choose "type_reviewer"  
    
    When I press "Create Account"
    
    Then I should be on the signup page
  
    