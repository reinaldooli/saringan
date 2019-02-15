# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Translator do
  let(:translator) { described_class }
  let(:start) { DateTime.now }
  let(:finish) { start + 30 }
  let(:query) { "date::dt[#{start.iso8601}~#{finish.iso8601}]" }

  describe '#translate' do
    context 'inclusion range' do
    end

    context 'between range' do
      it 'to rails query correctly' do
        result = translator.translate(query)
        expected = {"date": start..finish}

        expect(result.first[:date]).not_to be_nil
      end
    end
  end
end
