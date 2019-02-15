# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/matcher'

module Saringan
  module Qualifiers
    class Inclusion
      extend Saringan::Matcher

      MATCHER = /\|+/
      TYPE = :inclusion

      def initialize(value, parser)
        @value = value
        @parser = parser
        qualify
      end

      def qualify
        @values = @value.split(MATCHER).map(&:strip)
      end

      def value
        @values.map{|val| @parser.parse(val)}
      end

      private

        def self.matcher
          MATCHER
        end

    end
  end
end
