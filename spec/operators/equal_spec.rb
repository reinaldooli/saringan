# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Operators::Equal do
  describe '#match?' do
    it 'should match equals operator' do
      term = 'name::john'
      expect(Saringan::Operators::Equal.match?(term)).to be_truthy
    end

    it 'should not match other operators' do
      term = 'name:!:john'
      expect(Saringan::Operators::Equal.match?(term)).to be_falsy
    end
  end

  describe '#split' do
    let(:term) { 'name::john' }

    it 'should split term' do
      splitted = Saringan::Operators::Equal.split(term)
      expect(splitted.size).to eq(2)
    end

    context 'splitted key' do
      it 'should match term key' do
        splitted = Saringan::Operators::Equal.split(term)
        expect(splitted[:key]).to eq('name')
      end
    end

    context 'splitted value' do
      it 'should match term value' do
        splitted = Saringan::Operators::Equal.split(term)
        expect(splitted[:value]).to eq('john')
      end
    end
  end

  describe '#to_h' do
    it 'should transform term into hash' do
      term = 'name::john'
      parsed = Saringan::Operators::Equal.to_h(term)

      expect(parsed).to eq({name: 'john'})
    end
  end

  describe '#to_query' do
    it 'should transform term keys into query' do
      term = 'name::john'
      parsed = Saringan::Operators::Equal.to_query(term)

      expect(parsed[:query]).to eq("name = ?")
    end

    it 'should transform term values into params to query' do
      term = 'name::john'
      parsed = Saringan::Operators::Equal.to_query(term)

      expect(parsed[:params]).to eq('john')
    end
  end
end
