# PdfMatcher::Testing

[![Gem Version](https://badge.fury.io/rb/pdf_matcher-testing.svg)](https://badge.fury.io/rb/pdf_matcher-testing)
[![Test](https://github.com/hidakatsuya/pdf_matcher-testing/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/hidakatsuya/pdf_matcher-testing/actions/workflows/test.yml)

This gem allows testing frameworks such as [Test::Unit](https://github.com/test-unit/test-unit), [RSpec](https://github.com/rspec/rspec) and [Minitest](https://github.com/seattlerb/minitest) to perform PDF matching tests with the [pdf_matcher gem](https://github.com/hidakatsuya/pdf_matcher).

## Prerequisites

This gem works with diff-pdf and pdf_matcher gem. See [the documentation of the pdf_matcher gem](https://github.com/hidakatsuya/pdf_matcher#prerequisites).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf_matcher-testing', require: false
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pdf_matcher-testing

## Usage

### Test::Unit

```ruby
require 'pdf_matcher/testing/test_unit_adapter'
```

You will be able to use the `assert_match_pdf`:

```ruby
assert_match_pdf expected_pdf_data, actual_pdf_data
assert_match_pdf '/path/to/expected.pdf', '/path/to/actual.pdf'
assert_match_pdf Pathname('/path/to/expected.pdf'), Pathname('/path/to/actual.pdf')

# Generating a difference PDF
assert_match_pdf expected_pdf_data, actual_pdf_data, output_diff: '/path/to/diff.pdf'
```

Or, you can enable the assertion manually:

```ruby
require 'pdf_matcher/testing/assertion'

# Enabling globally
class Test::Unit::TestCase
  include PdfMatcher::Testing::Assertion
end

# Enabling individually
class FooTest < Test::Unit::TestCase
  include PdfMatcher::Testing::Assertion
end
```

### Minitest

```ruby
require 'pdf_matcher/testing/minitest_adapter'
```

You will be able to use the `assert_match_pdf` and the `must_match_pdf`:

Assertion:
```ruby
assert_match_pdf expected_pdf_data, actual_pdf_data
```

Expectation:
```ruby
expect(actual_pdf_data).to must_match_pdf(expected_pdf_data)
expect('/path/to/actual.pdf').to must_match_pdf('/path/to/expected.pdf')
expect(Pathname('/path/to/actual.pdf')).to must_match_pdf(Pathname('/path/to/expected.pdf'))

# Generating a difference PDF
expect(actual_pdf_data).to must_match_pdf(expected_pdf_data, output_diff: '/path/to/diff.pdf')
```

Or, you can setup the assertion manually as described in Test::Unit.

### RSpec

```ruby
require 'pdf_matcher/testing/rspec_adapter'
```

You will be able to use the `match_pdf`:

```ruby
expect(actual_pdf_data).to match_pdf(expected_pdf_data)
expect('/path/to/actual.pdf').to match_pdf('/path/to/expected.pdf')
expect(Pathname('/path/to/actual.pdf')).to match_pdf(Pathname('/path/to/expected.pdf'))

# Generating a differnce PDF
expect(actual_pdf_data).to match_pdf(expected_pdf_data, output_diff: '/path/to/diff.pdf')
```

Or, you can enable the matcher manually:

```ruby
require 'pdf_matcher/testing/matcher'

# Enabling globally
RSpec.configure do |config|
  config.include PdfMatcher::Testing::Matcher
end

# Enabling individually
RSpec.describe 'foo' do
  include PdfMatcher::Testing::Matcher
end
```

### Configuring diff-pdf command options

```ruby
PdfMatcher.config.diff_pdf_opts = %w(
  --mark-differences
  --channel-tolerance=40
)
```

See `diff-pdf --help` for the available diff-pdf options.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/pdf_matcher-testing.

## Testing

```
$ bundle install
$ bundle exec rake test
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
