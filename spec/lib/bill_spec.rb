require 'spec_helper'

describe Bill do

  let(:item) { Item.new("£3 item",  3.0) }

  describe "a simple total" do
    let(:attributes) do
      { items: [ item ] * 3, service_charge: 0.0, discount: 0.0 }
    end

    subject { Bill.new(attributes) }

    describe '#total' do
      it 'should return an amount' do
        expect(subject.total).to eq(9.0)
      end
    end

    describe '#split_by' do
      it 'should return an array of amounts' do
        expect(subject.split_by(3)).to eq([3.0, 3.0, 3.0])
      end
    end
  end

  describe "a less divisable total" do
    let(:attributes) do
      { items: [ item ] * 3, service_charge: 1.0, discount: 0.0 }
    end

    subject { Bill.new(attributes) }

    describe '#total' do
      it 'should return an amount' do
        expect(subject.total).to eq(10.0)
      end
    end

    describe '#split_by' do
      it 'should return an array of amounts' do
        prices = subject.split_by(3)
        expect(prices.count).to eq(3)
        expect(prices.count(3.33)).to eq(2)
        expect(prices.count(3.34)).to eq(1)
        expect(prices.inject(:+).round(2)).to eq(subject.total)
      end
    end
  end
end
