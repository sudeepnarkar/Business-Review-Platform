Given /the following users exist/ do |users_table|
 users_table.hashes.each do |user|
   # each returned element will be a hash whose key is the table header.
   # you should arrange to add that movie to the database here.
   #User.create!(user)
   testuser = User.create!(user)
   p testuser
   p user
   end
    #flunk "Unimplemented"
end

Given (/I sign up as as "(.+)"/i) do |name|
  step %Q{I am on the signup page}
  #p page.body
  step %Q{I fill in "Email" with "#{name}@university.edu"}
  step %Q{I fill in "Password" with "password"}
  step %Q{I fill in "Confirm" with "password"}
  step %Q{I choose "type_reviewer"}
  step %Q{I press "Create Account"}
  testuser = User.find_by_email("#{name}@university.edu")
  testuser.name = name
  testuser.save!
end

Given (/"(.+)" exists as a reviewer/i) do |arg1|
 User.find_or_create_by(name: arg1)
 
end
