# frozen_string_literal: true
# -*- encoding: utf-8 -*-

module Saringan
  class Term
    TERM_SEP = ','

    OP_N_EQUAL_S = /:!:/
    OP_N_EQUAL_I = /:<>:/
    OP_LESS      = /:<:/
    OP_BIGGER    = /:>:/

    class << self
      def split(query)
        query.split(TERM_SEP)
      end
    end
  end
end
