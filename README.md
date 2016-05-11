For this project, we intend to create a interactive web application that shall allow users associated with
a college or university to generate and view ratings and reviews of local businesses.

Made with Rails 4.2.4 and ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-linux]
Instructions for running this project on your own server are in readme.pdf. 

Optional: 
If you want to start with businesses in you area:
in your remote directory:
in db/seeds.rb, change the variables lat and long to equal your actual coordinates. it is orginally hard coded with a latitude & longitude around Binghamton Univerity

On local server:
between bundle exec rake db:migrate and rails s -p $PORT -b $IP
do $: bundle exec rake db:seed
So that the sequence of commands is:
gem install bundler
bundle install --without production
bundle exec rake db:migrate
bundle exec rake db:seed
rails server -b $IP -p $PORT

On HEroku:
between heroku run rake db:migrate ad heroku open
fo $: heroku run rake db:seed
So tht the sequence of commands is:
heroku login
heroku create
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
heroku open
