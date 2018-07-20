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

  describe '#qualify' do
    context 'for inclusion values' do
      it 'parse inclusion values as array' do
        value = 'val; val; val'
        parsed = qualifier.qualify(value, nil)
        expect(parsed[:value]).to have(3).items
      end
    end

    context 'for between values' do
      it 'parse between values as from/to hash' do
        value = 'val~val~val'
        parsed = qualifier.qualify(value, nil)
        expect(parsed[:value]).to have(2).items
      end
    end
  end
end
