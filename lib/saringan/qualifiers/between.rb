# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/matcher'

module Saringan
  module Qualifiers
    class Between
      extend Saringan::Matcher

      MATCHER = /\~+/
      TYPE = :between

      def initialize(value, parser)
        @value = value
        @parser = parser
        qualify
      end

      def qualify
        @from, @to = @value.split(MATCHER, 2)
      end

      def value
        @parser.parse(@from)..@parser.parse(@to)
      end

      private

        def self.matcher
          MATCHER
        end
    end
  end
end
