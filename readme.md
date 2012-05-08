Get up and running quickly with Rails.

### prereqs

make sure you have new-ish version of [PostgreSQL](http://www.postgresql.org/) installed (and optionally [RVM](http://beginrescueend.com/))

### checklist

1. `git clone git://github.com/6/rails-on-rails.git APPNAME`
1. edit `APPNAME/.rvmrc` to change gemset name
1. `cd APPNAME` and run `bundle install`
1. `git remote rm origin` and then `git remote add origin your-github-repo-url`
1. add upstream URL to pull in later changes with `git remote add upstream https://github.com/6/rails-on-rails.git`
1. run `rails c`, enter `SecureRandom.hex(64)`, and copy that value to `config/initializers/secret_token.rb`
1. edit `config/database.yml` and make DB config changes
1. create `.env` and insert any secret ENV variables (e.g. API keys). Add `BASE_URL=http://localhost:5000`
1. edit `config/locales/en.yml` to insert your app info
1. `rake db:create` and then `rake db:migrate`
1. create a heroku app on cedar: `heroku create APPNAME -s cedar`
1. add newrelic: `heroku addons:add newrelic:standard`

Once you sign up, you can make yourself (or other users) and admin:

    rails c
    User.find_by_email("your@email.com").add_role :admin

Then, navigate to http://localhost:5000/admin to administer data.

### start

run `foreman start`

### pulling in updates

    git fetch upstream
    git merge upstream/master
