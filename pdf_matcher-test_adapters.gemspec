require_relative 'lib/pdf_matcher/test_adapters/version'

Gem::Specification.new do |spec|
  spec.name          = 'pdf_matcher-test_adapters'
  spec.version       = PdfMatcher::TestAdapters::VERSION
  spec.authors       = ['Katsuya Hidaka']
  spec.email         = ['hidakatsuya@gmail.com']

  spec.description   = 'This gem provides adapters to adds a matcher to Test::Unit, RSpec and Minitest to test for PDF matches.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/hidakatsuya/pdf_matcher-test_adapters'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/hidakatsuya/pdf_matcher-test_adapters/blob/main/CHANGELOG.md'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  end
  spec.require_paths = ['lib']
end
