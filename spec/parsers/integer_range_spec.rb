# require 'support/spec_helper'
#
# describe Saringan::Parsers::IntegerRange do
#   let(:parser){ Saringan::Parsers::IntegerRange }
#
#   describe '#match?' do
#     it 'should match range value' do
#       value = 'i[1|3]'
#       expect(parser.match?(value)).to be_truthy
#     end
#
#     it 'should not match non integer range value' do
#       value = '[1|3]'
#       expect(parser.match?(value)).to be_falsy
#     end
#   end
# end
