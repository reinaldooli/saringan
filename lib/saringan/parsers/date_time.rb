# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'active_support/core_ext/time'
require 'active_support/core_ext/date_time'
require 'saringan/matcher'

module Saringan
  module Parsers
    class DateTime
      extend Saringan::Matcher

      MATCHER = /^dt\[(.+)\]$/
      FORMAT = '%Y-%m-%d %H:%M:%S'

      class << self
        def clean(value)
          value.gsub(/^dt\[|\]$/, '')
        end

        def parse(value)
          cleaned = clean(value)
          date = ::DateTime.strptime(cleaned, FORMAT)
          ::DateTime.new date.year, date.month, date.day, date.hour, date.min, \
            date.sec, ::DateTime.current.zone
        end
        alias_method :to_proc, :parse

        def matcher
          MATCHER
        end
      end
    end
  end
end
