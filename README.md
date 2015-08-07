# Readme

[![Gem Version](https://badge.fury.io/rb/isaf_id_validator.svg)](http://badge.fury.io/rb/isaf_id_validator)

This gem is validator for [ISAF Sailor ID](http://www.sailing.org/isafsailor).
It works with `Rails 4` but it should work with `Rails 3` too.

## Usage

Add to your Gemfile:

```ruby
gem 'isaf_id_validator'
```

Run:

```bash
bundle install
```

Then add the following to your model:

```ruby
validates :isaf_id_attribute, isaf_id: true
```

## Testing

Use `rspec` to run the tests.

```bash
bundle exec rspec
```

## Credit

Used [`email_validator`](https://github.com/balexand/email_validator) as a
template for this.

## Contributing

Your contributions are welcome. Please fork the project, make a new branch and
send me a pull request.
