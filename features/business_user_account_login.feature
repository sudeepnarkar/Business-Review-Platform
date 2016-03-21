Feature: Login to Business User account
    
    As a Business User
    I want to to login to my account
    So that I can view my business profile

Background:

    Given  I'm a Business Owner
    When  I have an account
    Then  I should be able to login with my credentials

Scenario:business user enters correct credentials

    When I enter the url of the "Business Review Platform" portal
    Then I should be able to see the login page
    And I click on the login page
    Then I should see a screen with fields "username" and "password"
    And I enter my credentials
    Then I should be able to successfully log into my account

Scenario:business user enters incorrect credentials

    When I enter the url of the "Business Review Platform" portal
    Then I should be able to see the login/signup page
    And I click on the Login page
    Then I should see a screen with fields "username" and "password"
    And I enter my credentials
    Then I should be able to view an error message "Check your credentials"
