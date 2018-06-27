require 'support/spec_helper'

describe Saringan::Translator do
  let(:translator) { Saringan::Translator }

  describe '#translate' do
    context 'for date time ranges' do
      let(:query) { 'created_at::dt[2018-06-01 00:00:00|2018-06-30 23:59:59]' }

      it 'should translate date time query string to ruby hash' do
        from = DateTime.strptime('2018-06-01 00:00:00', '%Y-%m-%d %H:%M:%S')
        to = DateTime.strptime('2018-06-30 23:59:59', '%Y-%m-%d %H:%M:%S')

        expect(translator.translate(query)).to eq({ created_at: from..to })
      end
    end
  end
end
