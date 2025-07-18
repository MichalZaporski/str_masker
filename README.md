# StrMasker

A simple and flexible Ruby gem for masking portions of strings with customizable characters.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'str_masker'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install str_masker
```

## Usage

StrMasker provides a simple interface for masking strings with asterisks or any custom character.

### Basic Usage

```ruby
require 'str_masker'

# Mask entire string (default behavior)
StrMasker.mask_string("password")
#=> "********"

# Mask middle characters, keeping first and last
StrMasker.mask_string("password", from: 1, to: -2)
#=> "p******d"

# Mask from beginning, keeping last character
StrMasker.mask_string("secret", from: 0, to: -2)
#=> "*****t"

# Mask from second character to end
StrMasker.mask_string("confidential", from: 1, to: -1)
#=> "c***********"
```

### Custom Masking Character

```ruby
# Use a different character for masking
StrMasker.mask_string("password", from: 1, to: -2, char: '#')
#=> "p######d"

StrMasker.mask_string("email@example.com", from: 2, to: -5, char: 'X')
#=> "emXXXXXXXXX.com"
```

### Edge Cases

```ruby
# Returns nil for nil input
StrMasker.mask_string(nil)
#=> nil

# Returns original string if no masking is needed
StrMasker.mask_string("ab", from: 1, to: -2)
#=> "ab"

# Empty string
StrMasker.mask_string("")
#=> ""
```

## API Reference

### `mask_string(val, from: 0, to: -1, char: '*')`

Masks a portion of a string with the specified character.

#### Parameters

- `val` (String, nil): The string to mask. Returns `nil` if input is `nil`.
- `from` (Integer, optional): Starting position for masking (inclusive). Must be non-negative. Default: `0`.
- `to` (Integer, optional): Ending position for masking (must be negative, counts from end). Default: `-1`.
- `char` (String, optional): The character to use for masking. Must be a single character. Default: `'*'`.

#### Returns

- `String` or `nil`: The masked string, or `nil` if input was `nil`.

#### Raises

- `ArgumentError`: If `from` is negative, `to` is non-negative, or `char` is not a single character.



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MichalZaporski/str_masker.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).
