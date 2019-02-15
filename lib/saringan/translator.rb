# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/operator'
require 'saringan/statement'

module Saringan
  class Translator
    class << self
      def translate(query)
        terms = term.split(query)
        terms.map do |t|
          Saringan::Statement.build(t).to_query
        end
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
