# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Qualifiers::Inclusion, type: :qualifier do
  let(:qualifier) { described_class }

  describe '#match?' do
    it 'matches inclusion value' do
      value = 'val; val; val'
      expect(qualifier.match?(value)).to be_truthy
    end

    it 'not matches non inclusion value' do
      value = 'val \ val \ val'
      expect(qualifier.match?(value)).to be_falsy
    end
  end

  describe '#qualify' do
    it 'parse value to array' do
      value = 'val;val;val'
      expect(qualifier.qualify(value)).to have(3).items
    end
  end
end
