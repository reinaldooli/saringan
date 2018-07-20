# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'saringan/qualifiers/range'

module Saringan
  class Qualifier

    class << self
      def qualify(value)
        range.parse_value(value) if range.match?(value)
      end

      private

        def range
          Saringan::Qualifiers::Range
        end

    end
  end
end
