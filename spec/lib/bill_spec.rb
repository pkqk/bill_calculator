require 'spec_helper'

describe Bill do
  describe "a simple total" do
    let(:attributes) do
      { subtotal: 9.0, service_charge: 0.0, discount: 0.0 }
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
      { subtotal: 9.0, service_charge: 1.0, discount: 0.0 }
    end

    subject { Bill.new(attributes) }

    describe '#total' do
      it 'should return an amount' do
        expect(subject.total).to eq(10.0)
      end
    end

    describe '#split_by' do
      it 'should return an array of amounts' do
        expect(subject.split_by(3)).to eq([3.33, 3.33, 3.34])
      end
    end
  end
end
