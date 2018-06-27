require 'saringan/parsers'

module Saringan
  class Parser
    class << self
      def parse(value)
        return range.to_h(value) if range.match?(value)
        return datetime_range_parser(value) if date_time_range.match?(value)
        value
      end

      def datetime_range_parser(value)
        values  = date_time_range.to_h(value)
        values[:from]..values[:to]
      end

      private

        def range
          Saringan::Parsers::Range
        end

        def date_time_range
          Saringan::Parsers::DateTimeRange
        end
    end
  end
end
