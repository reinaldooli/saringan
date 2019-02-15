# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Parsers::Date, type: :parsers do
  let(:parser) { described_class }
  let(:date) { Date.new(2018, 06, 01) }

  describe '#match?' do
    it 'match date value' do
      value = 'd(2018-06-01)'
      expect(parser.match?(value)).to be_truthy
    end

    it 'match date time value' do
      value = 'd(2018-06-01T00:00:00.000)'
      expect(parser.match?(value)).to be_truthy
    end

    it 'do not match non date value' do
      value = 'i(1)'
      expect(parser.match?(value)).to be_falsy
    end
  end

  describe '#clean' do
    it 'remove range markup from value' do
      value = 'd(2018-06-01)'
      expect(parser.clean(value)).to eq('2018-06-01')
    end
  end

  describe '#parse' do
    it 'parse value to Date' do
      value = 'd(2018-06-01)'
      expect(parser.parse(value)).to eq(date)
    end

    it 'parse value to Date even value is a DateTime' do
      value = 'd(2018-06-01T00:00:00.000)'
      expect(parser.parse(value)).to eq(date)
    end
  end
end
