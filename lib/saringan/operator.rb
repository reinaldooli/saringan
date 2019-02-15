# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/operators/equal'
require 'saringan/operators/greater'
require 'saringan/operators/greater_equal'

module Saringan
  class Operator

    OPERATORS = [
      Saringan::Operators::Equal,
      Saringan::Operators::GreaterEqual
    ]

    class << self
      def build(term)
        OPERATORS.each do |operator|
          return operator.new(term) if operator.match?(term)
        end
      end
    end
  end
end
