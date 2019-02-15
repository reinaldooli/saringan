# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Operators::Greater do
  let(:operator) { described_class }

  describe '#match?' do
    it 'should match greater operator' do
      term = 'name:>john'
      expect(operator.match?(term)).to be_truthy
    end

    it 'should not match other operators' do
      term = 'name:!:john'
      expect(operator.match?(term)).to be_falsy
    end
  end

  context 'initialization' do
    let(:instance) { operator.new('name:>john') }

    it 'extract term subject' do
      expect(instance.subject).to eq('name')
    end

    it 'extract term value' do
      expect(instance.value).to eq('john')
    end
  end
end
