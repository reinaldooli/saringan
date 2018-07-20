# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/matcher'

module Saringan
  module Qualifiers
    class Between
      extend Saringan::Matcher

      QL_BETWEEN = /\~+/

      class << self
        def matcher
          QL_BETWEEN
        end

        def qualify(value, parser = nil)
          splitted = value.split(QL_BETWEEN)[0,2]
          splitted.map{|v| parser.nil? ? v : parser.parse(v)}
        end
      end
    end
  end
end
