require 'support/spec_helper'

describe Saringan::Parsers::Range do
  let(:parser){ Saringan::Parsers::Range }

  describe '#match?' do
    it 'should match range value' do
      value = '[1|10]'
      expect(parser.match?(value)).to be_truthy
    end

    it 'should not match non range value' do
      value = '[1|10'
      expect(parser.match?(value)).to be_falsy
    end
  end

  describe '#clean' do
    it 'should remove range markup from value' do
      value = '[1|3]'
      expect(parser.clean(value)).to eq('1|3')
    end
  end

  describe '#splt' do
    it 'should separate range in from/to array' do
      value = '[1|3]'
      expect(parser.split(value)).to eq(["1", "3"])
    end
  end
end
