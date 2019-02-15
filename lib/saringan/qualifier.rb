# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/qualifiers/absolute'
require 'saringan/qualifiers/between'
require 'saringan/qualifiers/inclusion'
require 'saringan/qualifiers/range'

module Saringan
  class Qualifier

    RANGE_QUALIFIERS = [
      Saringan::Qualifiers::Between
    ]

    class << self
      def build(value)
        parser = Saringan::Parser.build(value)
        value = parser.clean(value)
        qualifier = nil

        if range.match?(value)
          value = range.clean(value)
          RANGE_QUALIFIERS.each do |q|
            qualifier = q if q.match?(value)
          end
          qualifier ||= Saringan::Qualifiers::Inclusion
        else
          value = absolute.clean(value)
          qualifier = absolute
        end

        qualifier.new(value, parser)
      end

      private

        def range
          Saringan::Qualifiers::Range
        end

        def absolute
          Saringan::Qualifiers::Absolute
        end

    end
  end
end
