# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require "saringan/operators/equal"
require "saringan/operators/range"

module Saringan
  class Operator
    class << self
      def parse(term)
        return equal.to_h(term) if equal.match?(term)
        return range.to_h(term) if range.match?(term)
      end

      private

        def equal
          Saringan::Operators::Equal
        end

        def range
          Saringan::Operators::Range
        end
    end
  end
end
