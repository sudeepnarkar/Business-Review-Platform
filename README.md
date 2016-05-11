For this project, we intend to create a interactive web application that shall allow users associated with
a college or university to generate and view ratings and reviews of local businesses.

Created with Rails 4.2.4 and ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-linux]

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

On Heroku:

between heroku run rake db:migrate ad heroku open

do $: heroku run rake db:seed

So that the sequence of commands is:

1. heroku login

2. heroku create

3. git push heroku master

4. heroku run rake db:migrate

5. heroku run rake db:seed

6. heroku open (If this does not work just go to your heroku dashboard and go to the link mentioned in the settings)
