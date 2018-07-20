# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/matcher'

module Saringan
  module Qualifiers
    class Inclusion
      extend Saringan::Matcher

      QL_INCLUSION = /\;+/

      class << self
        def qualify(value, parser = nil)
          splitted = value.split(QL_INCLUSION)
          parser.nil? ? splitted : splitted.map(&parser)
        end

        def matcher
          QL_INCLUSION
        end
      end
    end
  end
end
