require 'saringan/matcher'
# require 'saringan/parser'

module Saringan
  module Operators
    class GreaterEqual
      extend Saringan::Matcher

      OP_GREATER_EQUAL = />:/

      attr_reader :subject, :value

      def initialize(term)
        @subject, @value = term.split(OP_GREATER_EQUAL)
      end

      private

        def self.matcher
          OP_GREATER_EQUAL
        end
    end
  end
end