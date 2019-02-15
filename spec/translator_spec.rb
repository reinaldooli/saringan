# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Translator do
  let(:translator) { Saringan::Translator }

  describe '#translate' do

    # context 'for absolute equal values' do
    #   context 'and value is string' do
    #     let(:query) { 'name::john' }

    #     it 'translate query string to ruby hash' do
    #       expect(translator.translate(query)).to eq({ name: 'john' })
    #     end
    #   end
    # end

    context 'multiple filters' do
      context 'with two string values' do
        let(:query) { 'name::john,alias::snow' }

        it 'translate query string to ruby rash' do
          expect(translator.translate(query)).to eq([{ name: 'john' }, { alias: 'snow' }])
        end
      end

      context 'with date time range and string range' do
        let(:start) { DateTime.now }
        let(:finish) { start + 30 }

        let(:query) do
          "date::dt[#{start.iso8601}~#{finish.iso8601}],status::[accepted|refused]"
        end

        it 'translate query string to ruby hash' do
          result = translator.translate(query)
          expected = { status: ['accepted', 'refused'] }

          expect(result).to include(expected)
        end
      end
    end

    # context 'greater equal' do
    #   context 'for date values' do
    #     let(:query) { 'birthdate>:d(2018-06-30)' }

    #     it 'translate query to ruby query' do
    #       translated = translator.translate(query)[:query]
    #       expect(translated).to eq("birthdate >= ?")
    #     end

    #     it 'translated value should be a Date object' do
    #       date = Date.parse('2018-06-30')
    #       translated = translator.translate(query)[:params]
    #       expect(translated).to eq(date)
    #     end
    #   end
    # end
  end
end
