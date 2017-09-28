require 'spec_helper'
require 'checkout'

RSpec.describe "Checkout" do

    pricing = {:A => PricePolicy.new(50, Discount.new(20, 3)),
               :B => PricePolicy.new(30, Discount.new(15, 2)),
               :C => PricePolicy.new(20, Discount.new(0,1)),
               :D => PricePolicy.new(15, Discount.new(0,1))
              }

  it "can scan one item and calculate the total price to pay" do
    co = Checkout.new(pricing)
    co.buy("A")
    expect(co.total_to_pay).to eq (50)
  end

  it "can scan multiple items and calculate the total price to pay" do

    co = Checkout.new(pricing)
    co.buy("ACDA")
    expect(co.total_to_pay).to eq (135)
  end

  it "can calculate total cost to pay with discounts subtracted" do

    co = Checkout.new(pricing)
    co.buy("AAABBD")
    expect(co.total_to_pay).to eq (190)
  end

  it "can scan and price items incrementally" do

    co = Checkout.new(pricing)
    co.scan(:A, 2)
    expect(co.total_to_pay).to eq (100)
    co.scan(:B, 3)
    expect(co.total_to_pay).to eq (175)
    co.scan(:D, 2)
    expect(co.total_to_pay).to eq (205)
  end


end
