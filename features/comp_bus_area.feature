Feature: See how my business compares to businesses in the area
  
  Background: 
    Given I own a cafe called "Cafe DeLaOrange" at 73 Court Street, Binghamton, NY, 13901
    And "Cafe DeLaOrange" is a "cafe"
    And "Cafe DeLaOrange" has an average rating of 4 stars
    And other businesses around "Cafe DeLaOrange" exist and have an average rating of 3 stars
    
    
    Scenario: See my stuff
      When I go to "Cafe DeLaOrange"'s profile page
      Then I should see "Cafe DeLaOrange is #1"