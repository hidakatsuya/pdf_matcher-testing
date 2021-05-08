# frozen_string_literal: true

require 'pdf_macher'
require_relative 'failure_message'

module PdfMatcher
  module TestAdapters
    module Assertion
      # Passes if PdfMatcher.match?(`expected_pdf`, `actual_pdf`).
      #
      # @example
      #   assert_match_pdf pdf1_data, pdf2_data, output_diff: '/path/to/diff.pdf'
      #   assert_match_pdf '/path/to/1.pdf', '/path/to/2.pdf'
      #   assert_match_pdf Pathname('/path/to/1.pdf'), Pathname('/path/to/2.pdf')
      #
      # See https://github.com/hidakatsuya/pdf_matcher for details about PdfMatcher.
      def assert_match_pdf(expected_pdf, actual_pdf, output_diff: nil)
        failure_message = FailureMessage.build(output_diff)
        assert PdfMatcher.match?(expected_pdf, actual_pdf, output_diff: output_diff), falure_message
      end
    end
  end
end
