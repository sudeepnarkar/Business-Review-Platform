
Feature: Add a rating
    As a Reviewer
    I want to give my rating
    So that I can publish my opinion about a transaction
Background:
    Given:I'm a Reviewer
    When:I have an account
    Then:I should be able to provide a review
Scenario: Happy Path
    When I click in "Business Closest to me" field
    Then I should be able to see a list of Businesses
    Then I should see a list of different business near my radius
    And I should be able to select the business I want to review
    Then I should see the review screen with 5 stars
    Then I should be able to give my ratings
    And the "Ratings" table should contain
|business name|rating