Feature: See my reviews dashboard/profile
  As a reviewer
  I want to see my past reviews
  So that I can
  
  As a reviewer 
  I want no one else to see my past reviews
  So I have a sense of privacy
  
Background:
  Given "Nick Offerman" exists as a reviewer
  And I sign up as as "Amy Pohler"
  And I am on the index page
  
Scenario:
    When I follow image link "Profile"
    Then I should be on "Amy Pohler"'s page
    
Scenario:
    When I go to "Nick Offerman"'s page
    Then I should see "You do not have access to Nick Offerman's page"