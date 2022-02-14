# ExchangeParty

Fetch Central Bank of Turkey exchange rates from http://www.tcmb.gov.tr/. Exchange Rates are announced at 15:30 in every day by the bank.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exchange_party'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install exchange_party

## Usage

```ruby
# Gets currencies for one day before
currencies =  ExchangeParty.currencies # Returns an ExchangeParty::Currency object array
currency = currencies.first # Returns ExchangeParty::Currency object
currency.name # "ABD DOLARI"
currency.currency_name # "USD DOLLAR"
currency.code # "USD"
currency.name # "ABD DOLARI"
currency.currency_name # "USD DOLLAR"
currency.forex_buying # "13.4933"
currency.forex_selling # "13.5176 "
currency.bank_note_buying # "13.4839 "
currency.bank_note_selling # "13.5379"
currency.rate_announcement_date # "11.02.2022"
```

```ruby
# Gets currencies for an given date
currencies =  ExchangeParty.currencies("2022-02-09") # Returns an ExchangeParty::Currency object array
```

## Exception Handling

If you pass the invalid date format or something happens, it raises `StandartError` exception. You can rescue this error, then do something else.

```ruby
begin
  ExchangeParty.currencies("invaliddateformat")
rescue StandardError
  # do something here
  puts 'hello'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/exchange_party. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/exchange_party/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ExchangeParty project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/exchange_party/blob/master/CODE_OF_CONDUCT.md).
