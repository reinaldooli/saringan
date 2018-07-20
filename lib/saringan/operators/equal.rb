# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/parser'
require 'saringan/matcher'

module Saringan
  module Operators
    class Equal
      extend Saringan::Matcher

      OP_EQUAL = /::/

      class << self

        # TODO: Create an absolute qualifier
        def to_h(term)
          splitted = split(term)
          { "#{splitted[:key]}": parser.parse(splitted[:value]) }
        end

        def to_query(term)
          splitted = split(term)
          { query: "#{splitted[:key]} = ?", params: splitted[:value] }
        end

        def split(term)
          splitted = term.split(OP_EQUAL)
          { key: splitted[0], value: splitted[1] }
        end

        def matcher
          OP_EQUAL
        end

        private

          def parser
            Saringan::Parser
          end
      end
    end
  end
end
