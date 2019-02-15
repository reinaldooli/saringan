# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/parsers/date_time'
require 'saringan/parsers/date'
require 'saringan/parsers/string'

module Saringan
  class Parser

    PARSERS = [
      Saringan::Parsers::DateTime,
      Saringan::Parsers::Date
    ]

    class << self
      def build(value)
        PARSERS.each do |parser|
          return parser if parser.match?(value)
        end
        Saringan::Parsers::String
      end
    end
  end
end
