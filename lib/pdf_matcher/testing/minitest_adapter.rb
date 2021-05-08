# frozen_string_literal: true

require 'minitest'
require_relative 'assertion'

module Minitest
  class Test
    include PdfMatcher::Testing::Assertion
  end

  module Expectations
    infect_an_assertion :assert_match_pdf, :must_match_pdf
  end
end
