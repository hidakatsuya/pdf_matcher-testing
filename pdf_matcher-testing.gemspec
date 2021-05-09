require_relative 'lib/pdf_matcher/testing/version'

Gem::Specification.new do |spec|
  spec.name          = 'pdf_matcher-testing'
  spec.version       = PdfMatcher::Testing::VERSION
  spec.authors       = ['Katsuya Hidaka']
  spec.email         = ['hidakatsuya@gmail.com']

  spec.description   = 'This gem allows testing frameworks such as Test::Unit, RSpec and Minitest to perform PDF matching tests with the pdf_matcher gem.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/hidakatsuya/pdf_matcher-testing'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/hidakatsuya/pdf_matcher-testing/blob/main/CHANGELOG.md'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'pdf_matcher', '>= 1.0.0'
end
