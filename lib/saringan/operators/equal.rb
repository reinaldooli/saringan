# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/matcher'
require 'saringan/statements/equal'

module Saringan
  module Operators
    class Equal
      extend Saringan::Matcher

      OP_EQUAL = /::/

      attr_reader :subject, :value

      def initialize(term)
        @subject, @value = term.split(OP_EQUAL, 2)
      end

      private

        def self.matcher
          OP_EQUAL
        end
    end
  end
end
