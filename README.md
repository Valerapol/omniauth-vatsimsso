# Omniauth::Vatsim::Oauth2

OmniAuth::Strategies::Vatsim is an OmniAuth strategy for authenticating with the VATSIM SSO with OAuth2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-vatsimsso', '~> 0.1.0'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-vatsimsso

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vatsimsso, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
           client_options: {
             site: 'URL', # default to demo site
             response_type: 'code',
             token_method: :post,
             grant_type: 'authorization_code',
             redirect_uri: 'redirect_uri'
           },
           scope: 'full_name vatsim_details email country'
end
```
You can now access the OmniAuth VATSIM OAuth2 URL: `/auth/authorize`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Valerapol/omniauth-vatsimsso.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).