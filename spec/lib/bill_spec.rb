require 'spec_helper'

describe Bill do
  subject { Bill.new(attributes) }

  describe '#total' do
    xit 'should return an amount' do
      # Somthing like
      # expect(subject.total).to eq(<an_amount_here>)
    end
  end

  describe '#split_by' do
    xit 'should return an array of amounts' do
      # Somthing like
      # expect(subject.split_by(3)).to eq([<an_amount_here>, <an_amount_here>, <an_amount_here>])
    end
  end
end
