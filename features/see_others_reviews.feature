Feature: See others' reviews of a particular business

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
  
Scenario:
  When I am on the details page for "Kids Korner"
  Then I should see all reviews for "Kids Korner"
  