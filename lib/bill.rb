class Bill
  def initialize(subtotal:, service_charge: 0, discount: 0)
    @subtotal, @service_charge, @discount = subtotal, service_charge, discount
  end

  def total
    subtotal + service_charge - discount
  end

  def split_by(number)
    gross = total
    prices = []
    approx_split = (total / number).round(2)
    number.times do |i|
      #if approx_split <= gross
      if i == (number - 1)
        prices << gross
      else
        prices << approx_split
        gross -= approx_split
      end
    end
    prices
  end

  attr_reader :subtotal, :service_charge, :discount
end
