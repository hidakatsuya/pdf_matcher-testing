# frozen_string_literal: true

require 'pdf_matcher'
require_relative 'failure_message'

module PdfMatcher
  module Testing
    module Matcher
      def match_pdf(expected_pdf, output_diff: nil)
        MatchPdf.new(expected_pdf, output_diff)
      end

      class MatchPdf
        include ::RSpec::Matchers::Composable

        def initialize(expected_pdf, output_diff)
          @expected_pdf = expected_pdf
          @output_diff = output_diff
        end

        def matches?(actual_pdf)
          PdfMatcher.match?(@expected_pdf, actual_pdf, output_diff: @output_diff)
        end

        def failure_message
          FailureMessage.build(@output_diff)
        end

        def description
          'match the expected pdf'
        end
      end
    end
  end
end
