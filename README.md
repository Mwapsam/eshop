
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
