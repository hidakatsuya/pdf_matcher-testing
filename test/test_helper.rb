# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'prawn'
require 'tempfile'

module TestHelper
  def create_pdf_data(text: 'Hello')
    Prawn::Document.new { text(text) }.render
  end

  def create_pdf_file(path, text: 'Hello')
    Prawn::Document.generate(path) { text(text) }
  end

  def open_tempfiles
    tempfiles = Tempfiles.new
    yield tempfiles
  ensure
    tempfiles.close!
  end

  class Tempfiles
    def initialize
      @tempfiles = []
    end

    def create
      Tempfile.open do |tf|
        @tempfiles << tf
        tf.binmode
        yield tf.path if block_given?
        tf.path
      end
    end

    def close!
      @tempfiles.each(&:close!)
    end
  end
end
