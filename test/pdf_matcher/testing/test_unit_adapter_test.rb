# frozen_string_literal: true

require 'test_helper'

require 'test/unit'
require 'pdf_matcher/testing/test_unit_adapter'

class PdfMatcher::Testing::TestUnitAdapterTest < Test::Unit::TestCase
  include TestHelper

  test 'assert_match_pdf' do
    pdf1_data = create_pdf_data(text: 'Hello')
    pdf2_data = create_pdf_data(text: 'Hi')

    assert_match_pdf pdf1_data, pdf1_data

    open_tempfiles do |tempfiles|
      diff_pdf_path = tempfiles.create

      failure = assert_raises Test::Unit::AssertionFailedError do
        assert_match_pdf pdf1_data, pdf2_data, output_diff: diff_pdf_path
      end
      assert_includes failure.message, PdfMatcher::Testing::FailureMessage::BASE_MESSAGE

      assert_match %r|^%PDF-|, File.binread(diff_pdf_path)
    end
  end
end

