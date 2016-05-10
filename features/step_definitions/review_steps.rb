Given(/^The following reviews exist for "([^"]*)":$/) do |arg1, table|
  # table is a Cucumber::Core::Ast::DataTable
  test_bus = Business.find_or_create_by(name: arg1)

  table.hashes.each do |review|
      u = User.find_or_create_by(name: review[:reviewer])
      r = Review.create!(stars: review[:rating],create_date: review[:date], business_id: test_bus.id, user_id: u.id)
  end
  #pending # Write code here that turns the phrase above into concrete actions
  #p test_bus
  #p test_bus.reviews.inspect
  test_bus.average = test_bus.get_avg_rating;
  test_bus.save!
end

Given(/^"([^"]*)" has made the following reviews:$/) do |arg1, table|
  test_usr = User.find_or_create_by(name: arg1)
  #puts User.all.to_s
  table.hashes.each do |rev|
    tb = Business.find_or_create_by(name: rev[:place])
    Review.create!(stars: rev[:rating],create_date: rev[:date], business_id: tb.id)
  end
end

Then(/^I should see all of "([^"]*)"'s reviews$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  test_usr = User.find_by(name: arg1)
  revs = test_usr.reviews
  revs.each do |r|
    step %Q{I should see "#{r.business.name}" before "#{r.stars}" stars}
  end
end

Then(/^I should see all reviews for "([^"]*)"$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  test_bus = Business.find_by(name: arg1)
  revs = test_bus.reviews
  revs.each do |rev|
     #puts rev.inspect
     step %Q{I should see "#{rev.user.name}" before "#{rev.stars}" stars} 
     
  end
end

Then (/^I should see "(.+)" before "(.+)" stars/) do |name, i|
  #from the way it's set up now, there should be
  # i "/images/Star.svg.png" between name and the next "<br />"
  step %Q{I should see "#{name}"}
  #img_name = "Star.svg.png"
  #step %Q{I should see the image "img_name"}
  #puts page.body
  split_by_name = page.body.split("#{name}")  
  should_have_img = split_by_name[1].split("<br />")
  should_have_img[0].scan(/\/Star-.svg.png/).count.should eq(i.to_i)
end

Then (/^I should see the image "(.+)"$/) do |image|
    page.should have_xpath("//img[@src=\"/public/images/#{image}\"]")
end

#Given (/"(.+)" is logged in/) do |name|
#  page.set_rack_session('user_id' => User.find_by_name(name).id)
#end
