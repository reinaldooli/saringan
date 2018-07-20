# frozen_string_literal: true
# -*- encoding: utf-8 -*-

module Saringan
  module Matcher
    def match?(term)
      term =~ matcher
    end
  end
end
