# frozen_string_literal: true

require 'test/unit'
require_relative 'assertion'

module Test
  module Unit
    TestCase.include PdfMatcher::Testing::Assertion
  end
end
