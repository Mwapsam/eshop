
# To secure your Stripe credentials

```$env:EDITOR="notepad"```

```bundle exec rails credentials:edit```

## In the Editor type;
    stripe:
        secret: your_secret_key
        public: your_public_key

Save and exit the editor

## To access your stripe credentials

`Rails.application.credentials[:stripe][:secret]`

`Rails.application.credentials[:stripe][:public]`
<<<<<<< Updated upstream
=======

# Set master.key in production (heroku):

By default `master.key` is in `.gitignore`

heroku config:set RAILS_MASTER_KEY=123456789
heroku config:set RAILS_MASTER_KEY=`cat config/master.key`
heroku config:set RAILS_MASTER_KEY=`cat config/credentials/production.key`

In config/environments/production.rb uncomment `config.require_master_key = true`
# Deploy to heroku

`git add .`

`git commit -am "staging"`

`git push heroku master`

`heroku run rails db:migrate`
>>>>>>> Stashed changes
