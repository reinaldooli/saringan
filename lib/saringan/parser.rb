# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/parsers/date_time'

module Saringan
  class Parser
    class << self
      def parse(value)
        return date_time.parse(value) if date_time.match?(value)
        value
      end

      def build(value)
        return {value: date_time.clean(value), parser: date_time} if date_time.match?(value)
        { value: value, parser: nil }
      end

      private

        def date_time
          Saringan::Parsers::DateTime
        end
    end
  end
end
