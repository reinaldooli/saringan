require 'saringan/qualifier'

module Saringan
  module Statements
    class AbstractStatement
      attr_reader :operator, :qualifier, :field, :value, :type,
        :subject, :params

      def initialize(operator)
        @operator = operator
        @qualifier = Saringan::Qualifier.build(@operator.value)
        @field = @operator.subject
        @value = @qualifier.value
        @type = @qualifier.class::TYPE
      end
    end
  end
end