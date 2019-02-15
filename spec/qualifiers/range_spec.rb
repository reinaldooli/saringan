# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Qualifiers::Range, type: :qualifier do
  let(:qualifier) { described_class }

  describe '#match?' do
    it 'match inclusion range value' do
      value = '[val; val; val]'
      expect(qualifier.match?(value)).to be_truthy
    end

    it 'match between range value' do
      value = '[val\val]'
      expect(qualifier.match?(value)).to be_truthy
    end

    it 'not match unclosed range value' do
      value = '[value'
      expect(qualifier.match?(value)).to be_falsy
    end

    it 'not match non range value' do
      value = '(value)'
      expect(qualifier.match?(value)).to be_falsy
    end
  end

  describe '#clean' do
    it 'clean range value markup' do
      value, expected = '[value]', 'value'
      expect(qualifier.clean(value)).to eq(expected)
    end
  end
end
