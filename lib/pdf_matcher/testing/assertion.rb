# frozen_string_literal: true

require 'pdf_matcher'
require_relative 'failure_message'

module PdfMatcher
  module Testing
    module Assertion
      def assert_match_pdf(expected_pdf, actual_pdf, options = nil)
        output_diff = options&.fetch(:output_diff)
        failure_message = FailureMessage.build(output_diff)

        assert PdfMatcher.match?(expected_pdf, actual_pdf, output_diff: output_diff), failure_message
      end
    end
  end
end
