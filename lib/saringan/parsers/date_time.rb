# frozen_string_literal: true
# -*- encoding: utf-8 -*-
require 'active_support/core_ext/time'
require 'active_support/core_ext/date_time'
require 'saringan/matcher'

module Saringan
  module Parsers
    class DateTime
      extend Saringan::Matcher

      MATCHER = /^dt(\(|\[)(.+)(\)|\])$/
      FORMAT = '%Y-%m-%dT%H:%M:%S'

      def self.parse(value)
        date = ::DateTime.strptime(value, FORMAT)
        ::DateTime.new date.year, date.month, date.day, date.hour, date.min, \
          date.sec, ::DateTime.current.zone
      end

      def self.clean(value)
        value.gsub(/^dt/, '')
      end

      private

        def self.matcher
          MATCHER
        end
    end
  end
end
