require 'saringan/operator'

module Saringan
  class Translator
    class << self
      def translate(query)
        terms = term.split(query)
        parsed = terms.map do |term|
          operator.parse(term)
        end
        (parsed.size > 1) ? parsed : parsed.first
      end

      private

        def term
          Saringan::Term
        end

        def operator
          Saringan::Operator
        end
    end
  end
end
