Given(/^The following reviews exist for "([^"]*)":$/) do |arg1, table|
  # table is a Cucumber::Core::Ast::DataTable
  test_bus = Business.find_or_create_by(name: arg1)
  table.hashes.each do |review|
      r = Review.create!(stars: review[:rating])
      r.user_stub = UserStub.find_or_create_by(username: review[:reviewer])
      test_bus.reviews << r
  end
  #pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see all reviews for "([^"]*)"$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  test_bus = Business.find_by(name: arg1)
  revs = test_bus.reviews
  revs.each do |rev|
     #puts rev.inspect
     step %Q{I should see "#{rev.user_stub.username}" before "#{rev.stars}" stars} 
     
  end
end

Then (/^I should see "(.+)" before "(.+)" stars/) do |name, i|
  #from the way it's set up now, there should be
  # i "/images/Star.svg.png" between name and the next "<br />"
  step %Q{I should see "#{name}"}
  #img_name = "Star.svg.png"
  #step %Q{I should see the image "img_name"}
  split_by_name = page.body.split("#{name}")  
  should_have_img = split_by_name[1].split("<br />")
  should_have_img[0].scan(/\/images\/Star.svg.png/).count.should eq(i.to_i)
end

Then (/^I should see the image "(.+)"$/) do |image|
    page.should have_xpath("//img[@src=\"/public/images/#{image}\"]")
end