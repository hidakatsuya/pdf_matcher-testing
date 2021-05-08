# frozen_string_literal: true

require 'test_helper'

require 'minitest/autorun'
require 'pdf_matcher/testing/minitest_adapter'
require 'pathname'

class PdfMatcher::Testing::MinitestAdapterTest < Minitest::Test
  include TestHelper

  def test_assert_match_pdf_with_pdf_data_argument
    pdf1_data = create_pdf_data(text: 'Hello')
    pdf2_data = create_pdf_data(text: 'Hi')

    assert_match_pdf pdf1_data, pdf1_data

    open_tempfiles do |tempfiles|
      diff_pdf_path = tempfiles.create

      failure = assert_raises Minitest::Assertion do
        assert_match_pdf pdf1_data, pdf2_data, output_diff: diff_pdf_path
      end
      assert_includes failure.message, PdfMatcher::Testing::FailureMessage::BASE_MESSAGE

      assert_match %r|^%PDF-|, File.binread(diff_pdf_path)
    end
  end

  def test_assert_match_pdf_with_pdf_path_argument
    open_tempfiles do |tempfiles|
      pdf1_path = tempfiles.create { |path| create_pdf_file(path, text: 'Hello') }
      pdf2_path = tempfiles.create { |path| create_pdf_file(path, text: 'Hi') }

      assert_match_pdf Pathname(pdf1_path), pdf1_path

      assert_raises Minitest::Assertion do
        assert_match_pdf pdf1_path, Pathname(pdf2_path)
      end
    end
  end
end

describe 'PdfMatcher::Testing::MinitestAdapter' do
  include TestHelper

  describe '#must_match_pdf' do
    it 'should work' do
      pdf1_data = create_pdf_data(text: 'Hello')
      pdf2_data = create_pdf_data(text: 'Hi')

      _(pdf1_data).must_match_pdf(pdf1_data)

      open_tempfiles do |tempfiles|
        diff_pdf_path = tempfiles.create

        failure = _ do
          _(pdf1_data).must_match_pdf(pdf2_data, output_diff: diff_pdf_path)
        end.must_raise Minitest::Assertion

        _(failure.message).must_include PdfMatcher::Testing::FailureMessage::BASE_MESSAGE

        _(File.binread(diff_pdf_path)).must_match %r|^%PDF-|
      end
    end
  end
end
