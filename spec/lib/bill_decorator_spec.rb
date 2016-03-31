require 'spec_helper'

describe BillDecorator do
  let :bill do
    Bill.new(subtotal: 9.0, service_charge: 1.0, discount: 0.0)
  end
  subject { BillDecorator.new(bill) }

  describe '#total' do
    it 'should return a string with currency and two decimals' do
      expect(subject.total).to eq('£10.00')
    end
  end

  describe '#split_by' do
    it 'should return an array of amounts' do
      prices = subject.split_by(3)
      expect(prices.count).to eq(3)
      expect(prices.count('£3.33')).to eq(2)
      expect(prices.count('£3.34')).to eq(1)
    end
  end
end
