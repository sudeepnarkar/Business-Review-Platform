Feature: See average Business rating compared to previous times
  
  
  Background:
    Given The following reviews exist for "Kids Korner":
    |reviewer |rating|date       |
    | John    | 3    |01-Dec-2015|
    | panda   | 4    |01-Nov-2015|
    | Mary    | 5    |01-Mar-2015|
    | Sophie  | 5    |01-Jul-2015|
    | Patrick | 1    |01-Jan-2016|
    | Sandy   | 4    |01-Feb-2016|
    | Pearl   | 3    |01-Mar-2016|
    | Larry   | 5    |16-Apr-2016|
    | Gary    | 5    |15-Apr-2016|
    | Sue     | 5    |14-Apr-2016|
    | Stu     | 4    |07-Apr-2016|
    | Sven    | 5    |08-Apr-2016|
    | Marie   | 4    |06-Apr-2016|
    And I am logged in as "Kids Korner"'s owner
    
    Scenario: See overall average rating
      When I go to "Kids Korner"'s profile page
      Then I should see "Kids Korner has an overall average rating of 4.08"
      
      Scenario: Avg rating changes when review is added
        When "John" adds a 1 star review on "Kids Korner"
        And I go to "Kids Korner"'s profile page
        Then I should see "Kids Korner has an overall average rating of 3.86"
        
        Scenario: See how this week's rating compares to last week's
          When I go to "Kids Korner"'s profile page
          Then I should see "Ratings are up from last week"