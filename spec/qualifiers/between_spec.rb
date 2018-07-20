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
    it 'parse value to array' do
      value = 'val~val~val'
      expect(qualifier.qualify(value)).to have(2).items
    end
  end
end
