require 'saringan/matcher'
require 'saringan/qualifiers/inclusion'
require 'saringan/qualifiers/between'

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

        def qualify(value, parser)
          cleaned = value.gsub(QL_REPLACER, '')

          if between.match?(value)
            { type: :between, value: between.qualify(cleaned, parser) }
          else
            { type: :in, value: inclusion.qualify(cleaned, parser) }
          end
        end

        private

          def inclusion
            Saringan::Qualifiers::Inclusion
          end

          def between
            Saringan::Qualifiers::Between
          end
      end
    end
  end
end
