# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Qualifiers::Between, type: :qualifier do
  let(:qualifier) { described_class }

  describe '#match?' do
    it 'matches between values' do
      value = 'val~ val~ val'
      expect(qualifier.match?(value)).to be_truthy
    end

    it 'not matches non between value' do
      value = 'val ; val ; val'
      expect(qualifier.match?(value)).to be_falsy
    end
  end

  describe '#qualify' do
    let(:parser) { double('parser') }

    before do
      allow(parser).to receive(:parser).and_return(1, 10)
    end

    it 'split values in two parts' do
      value = '1~1~10'
      instance = qualifier.new(value, parser)

      expect(instance.qualify).to have(2).items
    end

    it 'split values correctly' do
      value = '1~10'
      instance = qualifier.new(value, parser)

      expect(instance.qualify).to eq(['1', '10'])
    end

  end
end
