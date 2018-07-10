require 'support/spec_helper'

describe Saringan::Translator do
  let(:translator) { Saringan::Translator }

  describe '#translate' do
    context 'for date time ranges' do
      let(:query) { 'created_at::dt[2018-06-01 00:00:00|2018-06-30 23:59:59]' }

      it 'should translate date time query string to ruby hash' do
        from = DateTime.new(2018, 06, 01, 00, 00, 00, DateTime.current.zone)
        to = DateTime.new(2018, 06, 30, 23, 59, 59, DateTime.current.zone)

        expect(translator.translate(query)).to eq({ created_at: from..to })
      end
    end

    context 'for absolute equal values' do
      context 'and value is string' do
        let(:query) { 'name::john' }

        it 'translate query string to ruby hash' do
          expect(translator.translate(query)).to eq({ name: 'john' })
        end
      end
    end
  end
end
