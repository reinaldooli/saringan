# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Term do
  let(:query) { 'name:name,age:18,gender:male' }

  it 'should separate query terms' do
    terms = Saringan::Term.split(query)
    expect(terms.size).to eq(3)
  end

  it 'should match query terms' do
    splited = %w(name:name age:18 gender:male)
    terms = Saringan::Term.split(query)
    expect(terms).to eq(splited)
  end
end
