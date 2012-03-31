Get up and running quickly with Rails.

### prereqs

make sure you have new-ish version of [PostgreSQL](http://www.postgresql.org/) installed (and optionally [RVM](http://beginrescueend.com/))

### checklist

1. `git clone git://github.com/6/rails-on-rails.git APPNAME`
1. edit `APPNAME/.rvmrc` to change gemset name
1. `cd APPNAME` and run `bundle install`
1. edit `.git/config` origin to point to your repo (switch to SSH read/write URL)
1. run `rails c`, enter `SecureRandom.hex(64)`, and copy that value to `config/initializers/secret_token.rb`
1. edit `config/database.yml` and make DB config changes
1. create `config/heroku_env.rb` and insert any secret ENV variables (e.g. API keys)
1. edit `config/locales/en.yml` to insert your app info
1. create a heroku app on cedar: `heroku create APPNAME -s cedar`
1. add newrelic: `heroku addons:add newrelic:standard`

### start

run `foreman start`
