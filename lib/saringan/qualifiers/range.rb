require 'saringan/matcher'

module Saringan
  module Qualifiers
    class Range
      extend Saringan::Matcher

      QL_RANGE     = /(^\[(.+)\])/
      QL_REPLACER  = /(^\[|\]$)/

      class << self
        def matcher
          QL_RANGE
        end

        def clean(value)
          value.gsub(QL_REPLACER,  '')
        end

      end
    end
  end
end
