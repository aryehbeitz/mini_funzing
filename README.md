# Mini Funzing App

* Setup

1. Install ruby 2.4.1 and rails 5.1.4

2. run `gem install bundle`, then `bundle install`, then `rake db:setup`

3. run a local server `rails s` and navigate to `localhost:3000`

## Notes

* You can register users. When registering a user, you can give Admin priviliges which give ability to create activities.

* The app comes with 3 users and 5 activities. see the seed file.

* When a user creates an order off an activity, it disappears for him. It also disappears if there is no more room left. Your own activities you can view and edit, but cannot order off them.

* New orders appear in the Orders tab
 