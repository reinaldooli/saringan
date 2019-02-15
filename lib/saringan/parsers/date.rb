require 'saringan/matcher'

module Saringan
  module Parsers
    class Date
      extend Saringan::Matcher

      MATCHER = /^d\((.+)\)$/
      FORMAT = '%Y-%m-%d'

      class << self
        def clean(value)
          value.gsub(/^d\(|\)$/, '')
        end

        def parse(value)
          cleaned = clean(value)
          ::Date.strptime(cleaned, FORMAT)
        end
        alias_method :to_proc, :parse

        def matcher
          MATCHER
        end
      end
    end
  end
end