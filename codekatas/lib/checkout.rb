class Discount

  def initialize(discount, quantity)
    @discount = discount
    @quantity = quantity
  end

  def calculate_for(quantity)
    (quantity / @quantity).floor * @discount
  end

end

class PricePolicy

  def initialize(price, discount)
    @price = price
    @discount = discount
  end

  def price_for(quantity)
    @price * quantity - discount_for(quantity)
  end

  def discount_for(quantity)
    @discount.calculate_for(quantity)
  end
end

class Checkout

  attr_reader :total_to_pay

  def initialize(pricing)
    @pricing = pricing
    @total_to_pay = 0
  end

  def scan(item, quantity)
    @total_to_pay += @pricing[item].price_for(quantity)
  end

  def buy(items)
    items_as_symbols = items.split("").map { |item| item.to_sym }
    quantities = get_quantities(items_as_symbols)
    quantities.each { |item, quantity| scan(item, quantity) }
  end

  def get_quantities(items)
    quantities = Hash.new(0)
    items.each { |item| quantities[item] += 1 }
    quantities
  end

end
