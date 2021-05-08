# frozen_string_literal: true

require 'test_helper'

require 'rspec/autorun'
require 'rspec/matchers/fail_matchers'

require 'pdf_matcher/testing/rspec_adapter'

RSpec.describe 'PdfMatcher::Testing::RSpecAdapter' do
  include TestHelper
  include RSpec::Matchers::FailMatchers

  describe '#match_pdf' do
    it 'should work' do
      pdf1_data = create_pdf_data(text: 'Hello')
      pdf2_data = create_pdf_data(text: 'Hi')

      expect(pdf1_data).to match_pdf(pdf1_data)

      open_tempfiles do |tempfiles|
        diff_pdf_path = tempfiles.create

        expect {
          expect(pdf1_data).to match_pdf(pdf2_data, output_diff: diff_pdf_path)
        }.to fail_with a_string_starting_with PdfMatcher::Testing::FailureMessage::BASE_MESSAGE

        expect(File.binread(diff_pdf_path)).to match(/^%PDF-/)
      end
    end
  end
end
