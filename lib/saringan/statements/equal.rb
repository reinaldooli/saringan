require 'saringan/statements/abstract_statement'

module Saringan
  module Statements
    class Equal < AbstractStatement
      def to_query
        {"#{@operator.subject}": @qualifier.value}
      end
    end
  end
end