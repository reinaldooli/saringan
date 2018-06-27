require 'saringan/operators'

module Saringan
  class Operator
    class << self
      def parse(term)
        return equal.to_h(term) if equal.match?(term)
      end

      private

        def equal
          Saringan::Operators::Equal
        end
    end
  end
end
