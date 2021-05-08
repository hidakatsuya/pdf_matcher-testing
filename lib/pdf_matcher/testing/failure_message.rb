# frozen_string_literal: true

module PdfMatcher
  module Testing
    module FailureMessage
      BASE_MESSAGE = 'The PDF contents did not match.'

      module_function

      def build(output_diff = nil)
        [BASE_MESSAGE, message_for_checking_output_diff(output_diff)].compact.join(' ')
      end

      def message_for_checking_output_diff(output_diff)
        output_diff ? "Check #{output_diff} for details of the differences." : nil
      end
    end
  end
end
