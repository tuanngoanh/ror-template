# README

#---------------------------------------------------------
# PROJECT INFO:
#---------------------------------------------------------

* Ruby version: 2.4.2, Rails 5

* System dependencies: macOS, Linux with postgresql

* Configuration: Bootstrap 3.3.7, Theme (JavaScript + CSS)

* Database creation: postgresql


#---------------------------------------------------------
# SETUP AND RUN:
#---------------------------------------------------------

* bundle install

* rake db:create

* rake db:migrate

* rake db:seed

* rake db:seed:single SEED=temp_users

* login:
    - admin: admin1@mailinator.com / 123456
    - user:  user1@mailinator.com / 123456


#---------------------------------------------------------
# RUN UNIT TESTS:
#---------------------------------------------------------

* run all tests:    rspec test

* model tests:      rspec test/models