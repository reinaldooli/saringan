# frozen_string_literal: true
# -*- encoding: utf-8 -*-

require 'support/spec_helper'

describe Saringan::Translator do
  let(:translator) { described_class }

  describe '#translate' do
    context 'equal string' do
      it 'translates correctly' do
        translated = translator.translate('name::john')
        expect(translated).to eq([{name: 'john'}])
      end
    end

    context 'multiple terms' do
      it 'translate terms correctly' do
        translated = translator
          .translate('name::john,last_name::(doe),email::j.doe@email.com')

        expect(translated).to eq([
          {name: 'john'},
          {last_name: 'doe'},
          {email: 'j.doe@email.com'}
        ])
      end
    end
  end
end
