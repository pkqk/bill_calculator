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

  describe "itemised bill split" do
    let(:steak) { Item.new("Really nice steak", 70.0) }
    let(:wine) { Item.new("Really nice wine", 30.0) }
    let(:bill) { Bill.new(items: [steak, wine], service_charge: 10.0, discount: 5.0) }

    it 'calculates the total' do
      expect(bill.total).to eq(105.0)
    end

    describe '#itemised_split' do
      it 'splits the bill by percentage of item prices of the total' do
        steak_split, wine_split = bill.itemised_split
        expect(steak_split.item).to eq(steak)
        expect(steak_split.service_charge).to eq(7.0)
        expect(steak_split.discount).to eq(3.5)

        expect(wine_split.item).to eq(wine)
        expect(wine_split.service_charge).to eq(3.0)
        expect(wine_split.discount).to eq(1.5)
      end
    end
  end
end
