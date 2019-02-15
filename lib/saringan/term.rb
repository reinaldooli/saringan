# frozen_string_literal: true
# -*- encoding: utf-8 -*-

module Saringan
  class Term
    TERM_SEP = ','

    class << self
      def split(query)
        query.split(TERM_SEP)
      end
    end
  end
end
