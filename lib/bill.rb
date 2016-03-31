class Bill
  def initialize(subtotal:, service_charge: 0, discount: 0)
    @subtotal, @service_charge, @discount = subtotal, service_charge, discount
  end

  def total
    subtotal + service_charge - discount
  end

  def split_by(number)
    split_price_by(total, number)
  end

  attr_reader :subtotal, :service_charge, :discount

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
