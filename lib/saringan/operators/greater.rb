require 'saringan/matcher'
require 'saringan/parser'

module Saringan
  module Operators
    class Greater
      extend Saringan::Matcher

      OP_GREATER = /:>/

      attr_reader :subject, :value

      def initialize(term)
        @subject, @value = term.split(OP_GREATER)
      end

      private

        def self.matcher
          OP_GREATER
        end
    end
  end
end