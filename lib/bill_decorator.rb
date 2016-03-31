class BillDecorator
  def initialize(bill)
    @bill = bill
  end

  def total
    format_currency(bill.total)
  end

  def split_by(number)
    bill.split_by(number).map{ |v| format_currency(v) }
  end

  private

  def format_currency(value)
    "£%.2f" % value
  end

  attr_reader :bill
end
