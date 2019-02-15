# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Qualifiers::Inclusion, type: :qualifier do
  let(:qualifier) { described_class }

  describe '#match?' do
    it 'matches inclusion value' do
      value = 'val| val| val'
      expect(qualifier.match?(value)).to be_truthy
    end

    it 'not matches non inclusion value' do
      value = 'val \ val \ val'
      expect(qualifier.match?(value)).to be_falsy
    end
  end

  describe '#qualify' do
    let(:parser) { double('parser') }

    before do
      allow(parser).to receive(:parse).and_return('val')
    end

    it 'parsed value match value size' do
      value = 'val|val|val'
      instance = qualifier.new(value, parser)

      expect(instance.qualify).to have(3).items
    end

    it 'parsed value must match value' do
      value = 'val|val|val'
      instance = qualifier.new(value, parser)

      expect(instance.qualify).to eq(['val', 'val', 'val'])
    end
  end
end
