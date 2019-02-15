require 'active_support/concern'
require 'saringan/statements/abstract_statement'

module Saringan
  module Statements
    class GreaterEqual < AbstractStatement
      def to_query
        [subject, params]
      end

      def subject
        "#{@operator.subject} >= ?"
      end

      def params
        @qualifier.value
      end
    end
  end
end