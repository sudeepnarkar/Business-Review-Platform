Given(/^I am logged in as "([^"]*)"'s owner$/) do |arg1|
  
end

When(/^"([^"]*)" adds a (\d+) star review on "([^"]*)"$/) do |arg1, arg2, arg3|
    u = User.find_or_create_by(name: arg1)
    b = Business.find_or_create_by(name: arg3)
    r = Review.create!(stars: arg2)
    u.reviews << r
    b.reviews << r
end