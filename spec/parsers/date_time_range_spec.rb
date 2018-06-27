require 'support/spec_helper'

describe Saringan::Parsers::DateTimeRange do
  let(:parser) { Saringan::Parsers::DateTimeRange }
  let(:from ) { DateTime.strptime('2018-06-01 00:00:00', '%Y-%m-%d %H:%M:%S') }
  let(:to) { DateTime.strptime('2018-06-30 23:59:59', '%Y-%m-%d %H:%M:%S') }

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

  describe '#split' do
    it 'should split value into from/to array' do
      value = 'dt[2018-06-01 00:00:00|2018-06-30 23:59:59]'
      expect(parser.split(value)).to eq([from, to])
    end
  end

  describe '#to_h' do
    it 'should translate value into from/to hash' do
      value = 'dt[2018-06-01 00:00:00|2018-06-30 23:59:59]'
      expect(parser.to_h(value)).to eq({from: from, to: to })
    end
  end
end
