require 'rails_helper'

RSpec.describe OrdersController do
  describe "GET index" do
    xit "assigns @orders" do
      session[:user_id] = "2"
      category = Category.create!(name: 'weapons')
      category.items.create!(name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")
      category.items.create!(name: 'Ice2', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main2.jpg', price: 2.99, description: "it's colder")
      user = User.create!(username: 'ned', password: 'stark', email: 'raven@raven.net', address: 'winterfell')
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      cart = Cart.new({ '1' => 1, '2' => 2 })
      order = Order.create(amount: cart.total, status: 3)
      order.add_order_items(cart)

      get :index
      expect(assigns(:orders)).to eq([order])
    end

    xit "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
