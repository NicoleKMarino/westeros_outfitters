require 'rails_helper'

RSpec.describe Cart, type: :model do

  it "should have initial contents" do
    cart = Cart.new({ "1" => 2 })

    expect(cart.contents).to eq({ "1" => 2 })
  end

  it "should have empty hash as initial contents if no session cart" do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it "should be able to add an item to cart" do
    cart = Cart.new({ "1" => 2 })

    cart.add_item(1)
    cart.add_item(2)

    expect(cart.contents).to eq({ "1" => 3, "2" => 1 })
  end

  it "should return the total number of items in cart" do
    cart = Cart.new({ "1" => 3, "2" => 1, "3" => 2 })

    expect(cart.total).to eq(6)
  end

  it "should return the number of a specific item" do
    cart = Cart.new({ "1" => 2 })

    expect(cart.count_of(1)).to eq(2)
  end

end
