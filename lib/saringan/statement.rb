require 'saringan/statements/equal'
require 'saringan/statements/greater_equal'

module Saringan
  class Statement
    def self.build(term)
      operator = Saringan::Operator.build(term)

      case operator
      when Operators::Equal
        Statements::Equal.new(operator)
      when Operators::GreaterEqual
        Statements::GreaterEqual.new(operator)
      end
    end
  end
end
