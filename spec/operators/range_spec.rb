# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Operators::Range, type: :operator do
  let(:operator) { described_class }

  describe '#qualify' do
    context 'for inclusion range' do
      it 'return values qualified as array' do
        value = 'val;val;val'
        qualified = operator.qualify(value, nil)
        expect(qualified[:value]).to have(3).items
      end

      it 'qualify values as inclusion' do
        value = 'val;val;val'
        qualified = operator.qualify(value, nil)
        expect(qualified[:type]).to eq(:in)
      end

      it 'qualified values was not changed' do
        value = 'val;val;val'
        qualified = operator.qualify(value, nil)
        expect(qualified[:value]).to eq(['val', 'val', 'val'])
      end
    end

    context 'for between range' do
      it 'return values qualified as array' do
        value = 'val~val'
        qualified = operator.qualify(value, nil)
        expect(qualified[:value]).to have(2).items
      end

      it 'qualify values as between' do
        value = 'val~val'
        qualified = operator.qualify(value, nil)
        expect(qualified[:type]).to eq(:between)
      end

      it 'between qualified values has only from/to values' do
        value = 'val1~val2~val_'
        qualified = operator.qualify(value, nil)
        expect(qualified[:value]).to eq(['val1', 'val2'])
      end
    end
  end

  describe '#split' do
    it 'split term as key => value hash' do
      term = 'status:>:[todo;doing;done]'
      expect(operator.split(term)).to eq({ key: 'status', value: '[todo;doing;done]'})
    end

    context 'splitted key' do
      it 'match term key' do
        term = 'status:>:[todo;doing;done]'
        splitted = operator.split(term)
        expect(splitted[:key]).to eq('status')
      end
    end

    context 'splitted value' do
      it 'match term value' do
        term = 'status:>:[todo;doing;done]'
        splitted = operator.split(term)
        expect(splitted[:value]).to eq('[todo;doing;done]')
      end
    end
  end

  describe '#to_h' do
    context 'for inclusion range' do
      it 'value must be an array' do
        term = 'status:>:[todo;doing;done]'
        hash = operator.to_h(term)
        expect(hash).to eq({ status: ['todo', 'doing', 'done'] })
      end
    end
  end
end
