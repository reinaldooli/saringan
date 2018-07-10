# frozen_string_literal: true
require 'active_support/core_ext/time'
require 'active_support/core_ext/date_time'

module Saringan
  module Parsers
    class DateTimeRange < Range
      MATCHER = /^dt\[(.+)\]$/
      FORMAT = '%Y-%m-%d %H:%M:%S'

      class << self
        def split(value)
          splitted = super(value)
          splitted.map do |part|
            date = DateTime.strptime(part, FORMAT)
            DateTime.new date.year, date.month, date.day, date.hour, date.min, \
              date.sec, DateTime.current.zone
          end
        end

        def clean(value)
          value.gsub(/^dt\[/, '').gsub(/\]$/, '')
        end
      end
    end
  end
end
