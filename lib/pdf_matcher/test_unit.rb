# frozen_string_literal: true

require 'test-unit'
require_relative 'test_adapters/assertion'

module Test
  module Unit
    TestCase.include PdfMatcher::TestAdapters::Assertion
  end
end
