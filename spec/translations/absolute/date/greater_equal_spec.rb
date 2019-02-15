# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Translator do
  let(:translator) { described_class }
  let(:date) { Date.today }
  let(:query) { "date>:d(#{date.iso8601})" }

  describe '#translate' do
    context 'greater equal date' do
      it 'translates correctly' do
        translated = translator.translate(query)
        expect(translated[0]).to eq(["date >= ?", date])
      end
    end
  end
end
