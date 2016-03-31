require 'spec_helper'

describe BillDecorator do
  subject { BillDecorator.new(bill) }

  describe '#total' do
    xit 'should return a string with currency and two decimals' do
      expect(subject.total).to eq('£10.00')
    end
  end

  describe '#split_by' do
    xit 'should return an array of amounts' do
      expect(subject.split_by(3)).to eq(['£3.34', '£3.33', '£3.33'])
    end
  end
end
