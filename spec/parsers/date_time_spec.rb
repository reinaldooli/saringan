# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Parsers::DateTime, type: :parsers do
  let(:parser) { described_class }
  let(:from ) { DateTime.new(2018, 06, 01, 00, 00, 00, DateTime.current.zone) }
  let(:to) { DateTime.new(2018, 06, 30, 23, 59, 59, DateTime.current.zone) }

  describe '#match?' do
    it 'should match date time range value' do
      value = 'dt[2018-06-01 00:00:00|2018-06-30 23:59:59]'
      expect(parser.match?(value)).to be_truthy
    end

    it 'should not match non date time range value' do
      value = 'i[1|5]'
      expect(parser.match?(value)).to be_falsy
    end
  end

  describe '#clean' do
    it 'should remove range markup from value' do
      value = 'dt[2018-06-01 00:00:00|2018-06-30 23:59:59]'
      expect(parser.clean(value)).to eq('2018-06-01 00:00:00|2018-06-30 23:59:59')
    end
  end

  describe '#parse' do
    it 'should parse value to DateTime' do
      value = '2018-06-01 00:00:00'
      expect(parser.parse(value)).to eq(from)
    end
  end

  # describe '#to_h' do
  #   context 'using between translator' do
  #     it 'should translate value into from/to hash' do
  #       value = 'dt[2018-06-01 00:00:00|2018-06-30 23:59:59]'
  #       expect(parser.to_h(value)[:value]).to eq([from, to])
  #     end
  #   end
  # end
end
