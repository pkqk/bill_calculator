class Bill
  def initialize(subtotal:, service_charge: 0, discount: 0)
    @subtotal, @service_charge, @discount = subtotal, service_charge, discount
  end

  def total
    subtotal + service_charge - discount
  end

  def split_by(number)
    # TODO: implement the split method
  end

  attr_reader :subtotal, :service_charge, :discount
end
