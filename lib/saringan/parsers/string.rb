module Saringan
  module Parsers
    class String

      def self.parse(value)
        value.to_s
      end

      def self.clean(value)
        parse value
      end
    end
  end
end