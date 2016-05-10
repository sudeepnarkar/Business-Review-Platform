# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the signup page/
      new_user_path
     
    when /the business user signup page/
      new_business_path
    
    when /the new review page/
      new_review_path
      
    when /the reviewer page for (.+)/
      user_path User.where(email: $1)[0].id

    when /^the home\s?page$/
       user_path
       
    when /the details page for "(.*)"/i
      business_path(Business.find_by_name($1))
    
    when /business page for "(.*)"/i  
        business_path(Business.find_by_email($1))
      
    when /"(.*)"'s page/i
      #puts User.all.inspect
      user_path(User.find_by_name($1))

    
    when /^the login page$/
      user_login_path
      
    when/"(.*)"'s profile page/i
      profile_business_path(Business.find_by_name($1))
      
    when /the listing page/i
      businesses_path
        
        
    when /the index page/i
      root_path
      

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
