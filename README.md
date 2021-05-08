# PdfMatcher::TestAdapters

This gem provides adapters to adds a matcher to [Test::Unit](https://github.com/test-unit/test-unit), [RSpec](https://github.com/rspec/rspec) and [Minitest](https://github.com/seattlerb/minitest) to test for PDF matches.

## Prerequisites

This gem works with diff-pdf and pdf_matcher gem. See [the documentation of the pdf_matcher gem](https://github.com/hidakatsuya/pdf_matcher#prerequisites).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf_matcher-test_adapters', require: false
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pdf_matcher-test_adapters

## Usage

### Test::Unit

```ruby
# test_helper.rb
require 'pdf_matcher/test_unit'
```

You will be able to use the `assert_match_pdf`:

```ruby
assert_match_pdf expected_pdf, actual_pdf
assert_match_pdf '/path/to/expected.pdf', '/path/to/actual.pdf'
assert_match_pdf Pathname('/path/to/expected.pdf'), Pathname('/path/to/actual.pdf')

# Generating a difference PDF
assert_match_pdf expected_pdf, actual_pdf, output_diff: '/path/to/diff.pdf'
```

### Minitest

```ruby
# test_helper.rb
require 'pdf_matcher/minitest'
```

You will be able to use the `assert_match_pdf` and the 'must_match_pdf':

Assertion:
```ruby
assert_match_pdf expected_pdf, actual_pdf
```

Expectation:
```ruby
expect(actual_pdf).to must_match_pdf(expected_pdf)
expect('/path/to/actual.pdf').to must_match_pdf('/path/to/expected.pdf')
expect(Pathname('/path/to/actual.pdf')).to must_match_pdf(Pathname('/path/to/expected.pdf'))

# Generating a difference PDF
expect(actual_pdf).to must_match_pdf(expected_pdf, output_diff: '/path/to/diff.pdf')
```

### RSpec

```ruby
# spec_helper.rb
require 'pdf_matcher/rspec'
```

You will be able to use the `match_pdf` matcher:

```ruby
expect(actual_pdf).to match_pdf(expected_pdf)
expect('/path/to/actual.pdf').to match_pdf('/path/to/expected.pdf')
expect(Pathname('/path/to/actual.pdf')).to match_pdf(Pathname('/path/to/expected.pdf'))

# Generating a differnce PDF
expect(actual_pdf).to match_pdf(expected_pdf, output_diff: '/path/to/diff.pdf')
```

### Configuring diff-pdf command options

```
PdfMatcher.config.diff_pdf_opts = %w(--dpi=300 --grayscale)
```

See `diff-pdf --help` for the available diff-pdf options.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/pdf_matcher-test_adapters.

## Testing

```
$ bundle install
$ bundle exec rake test
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
