# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/matcher'
require 'saringan/parser'
require 'saringan/qualifiers/range'

module Saringan
  module Operators
    class Range
      extend Saringan::Matcher

      OP_RANGE = /:>:/

      class << self
        def matcher
          OP_RANGE
        end

        def to_h(term)
          splitted = split(term)
          parsed = parser(splitted[:value])
          qualified = qualify(parsed[:value], parsed[:parser])

          case qualified[:type]
          when :in
            { "#{splitted[:key]}": qualified[:value] }
          when :between
            { "#{splitted[:key]}": qualified[:value][0]..qualified[:value][1] }
          end
        end

        def split(term)
          splitted = term.split(OP_RANGE)
          { key: splitted[0], value: splitted[1] }
        end

        def qualify(value, parser)
          qualifier.qualify(value, parser)
        end

        private

          def qualifier
            Saringan::Qualifiers::Range
          end

          def parser(value)
            Saringan::Parser.build(value)
          end
      end

    end
  end
end
