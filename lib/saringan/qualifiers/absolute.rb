module Saringan
  module Qualifiers
    class Absolute

      QL_REPLACER  = /^\(|\)$/
      TYPE = :absolute

      def initialize(value, parser)
        @value = self.class.clean(value)
        @parser = parser
      end

      def value
        @parser.parse(@value)
      end

      def self.clean(value)
        value.gsub(QL_REPLACER,  '')
      end

    end
  end
end