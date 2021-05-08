# frozen_string_literal: true

require 'minitest'
require_relative 'test_adapters/assertion'

module Minitest
  class Test
    include PdfMatcher::TestAdapters::Assertion
  end

  module Expectations
    infect_an_assertion :assert_match_pdf, :must_match_pdf
  end
end
