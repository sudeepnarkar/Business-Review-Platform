Feature: Searchable list of businesses
  
  Background:
    When there are some businesses in the area
  Scenario: See the page
    When I am on the listing page
    And I follow "Business"
    And I press "dist_sub"
    Then I should be on the listing page
    