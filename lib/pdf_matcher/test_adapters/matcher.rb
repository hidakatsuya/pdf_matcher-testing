# frozen_string_literal: true

require 'pdf_matcher'
require_relative 'test_adapters/falure_message'

module PdfMatcher
  module TestAdapters
    module Matcher
      def match_pdf(expected_pdf, output_diff: nil)
      end

      class MatchPdf
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
      end
    end
  end
end
