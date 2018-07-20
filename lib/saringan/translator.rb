# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/operator'

module Saringan
  class Translator
    class << self
      def translate(query)
        terms = term.split(query)
        parsed = {}
        terms.each{|term| parsed.merge!(operator.parse(term))}
        parsed
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
