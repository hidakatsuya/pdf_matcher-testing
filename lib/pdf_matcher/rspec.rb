# frozen_string_literal: true

require 'rspec'

require_relative 'test_adapters/matcher'

RSpec.configure do |c|
  c.include PdfMatcher::TestAdapters::Matcher
end
