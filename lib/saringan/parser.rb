require 'saringan/parsers'

module Saringan
  class Parser
    class << self
      def parse(value)
        return range.to_h(value) if range.match?(value)
        value
      end

      private

        def range
          Saringan::Parsers::Range
        end
    end
  end
end
