# :truck: Keep on Truckin' :truck:

Super simple API client for sending repeated requests to a common endpoint (i.e Google Analytics)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'truck_you'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install truck_you

In your `config/initializers/truck.rb`:

```yml
development:
  host: "www.google-analytics.com/collect"
  payload:
    v:    1
    t:    "pageview"
    tid:  "UA-XXXXXXXX-1"
    cid:  "88888888-4444-xxxx-xxxx-XXXXXXXXXXXX"
production:
  host: "www.google-analytics.com/collect"
  payload:
    v:    1
    t:    "pageview"
    tid:  "UA-XXXXXXXX-2"
    cid:  "88888888-4444-xxxx-xxxx-XXXXXXXXXXXX"
```

## Usage

TODO: Write usage instructions here

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/truck/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
