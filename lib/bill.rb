class Item < Struct.new(:name, :price)
end

class Bill
  def initialize(items:, service_charge: 0, discount: 0)
    @items, @service_charge, @discount = items, service_charge, discount
  end

  def total
    subtotal + service_charge - discount
  end

  def subtotal
    items.inject(0.0) { |amount, item| amount + item.price }
  end

  def split_by(number)
    split_price_by(total, number)
  end

  attr_reader :items, :service_charge, :discount

  private

  def split_price_by(amount, number)
    pence = (amount * 100).round(0)
    split = pence / number
    remainder = pence % number
    prices = [split] * number
    remainder.times do |i|
      prices[i % prices.count] += 1
    end
    prices.map { |p| p / 100.0 }
  end
end
