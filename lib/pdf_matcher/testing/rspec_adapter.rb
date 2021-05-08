# frozen_string_literal: true

require 'rspec'

require_relative 'matcher'

RSpec.configure do |c|
  c.include PdfMatcher::Testing::Matcher
end
