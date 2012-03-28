Get up and running quickly with Rails.

### checklist

1. `git clone git://github.com/6/rails-boilerplate.git`
1. edit `/.rvmrc` to change gemset name
1. `cd` into the app folder and run `bundle install`
1. edit `/.git/config` origin to point to your repo (change URL to SSH version)
1. run `rails c`, enter `SecureRandom.hex(64)`, and copy that value to `/config/initializers/secret_token.rb`
1. edit `/config/database.yml` and make DB config changes
1. create `/config/heroku_env.rb` and insert any secret ENV variables
1. edit `/config/locales/en.yml` to insert your app info
1. create a heroku app on cedar: `heroku create APPNAME -s cedar`
1. add newrelic: `heroku addons:add newrelic:standard`

### start

run `foreman start`
