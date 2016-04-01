Feature: See a specific user's reviews
  
Background:
  Given "John" has made the following reviews:
    |place        |rating|date      |
    | Kids Korner | 3    |1-Dec-2015|
    | Sals Pizza  | 4    |2-Dec-2015|
    | Tinos Pizza | 5    |3-Dec-2015|
  #And "John" is logged in
  
Scenario: I see someone's reviews reviews
    When I am on "John"'s page
    Then I should see all of "John"'s reviews
  