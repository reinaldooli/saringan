# frozen_string_literal: true
# -*- encoding: utf-8 -*-

module Saringan
  module Parsers
    class Range
      MATCHER = /^\[(.+)\]$/

      class << self
        def match?(value)
          value =~ matcher
        end

        def to_h(value)
          splitted = split(value)
          { from: parse_value(splitted[0]), to: parse_value(splitted[1]) }
        end

        def split(value)
          cleaned = clean(value)
          cleaned.split('|')
        end

        def clean(value)
          value.gsub(/^\[/, '').gsub(/\]$/, '')
        end

        def parse_value(value)
          value
        end

        private

          def matcher
            self::MATCHER
          end
      end
    end
  end
end
