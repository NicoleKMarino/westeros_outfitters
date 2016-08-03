require 'rails_helper'

RSpec.feature 'visitor must login or create account to be able to checkout' do
  scenario 'visitor creates account after putting items in cart' do
    category = Category.create!(name: 'weapons')
    category.items.create!(name: 'Ice', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: "it's cold")

    visit category_path(category)

    click_on 'Add to Cart'
    click_on 'View Cart'

    expect(page).to_not have_button('Checkout')
    expect(page).to have_content('Login or Create Account to Checkout')
    expect(page).to have_content ('Ice')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")

    click_on 'Create Account'
    fill_in 'Username', with: 'matt'
    fill_in 'Password', with: 'campbell'
    fill_in 'Email', with: 'RRBean'
    fill_in 'Address', with: 'that one place'
    click_on 'Submit'

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Your Cart')
    expect(page).to have_content ('Ice')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ("it's cold")
    expect(page).to have_button ('Checkout')

    click_on 'Logout'

    expect(page).to have_content('Login')
    expect(page).to_not have_button('Checkout')
  end

  scenario 'visitor logs in after putting items in cart' do
    category = Category.create!(name: 'things')
    category.items.create!(id: 1, name: 'Toy', img: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg', price: 0.99, description: 'cold')
    User.create!(id: 10, username: 'user', password: 'test', address: 'user street', email: 'user.com', role: 0)

    visit category_path(category)

    click_on 'Add to Cart'
    click_on 'View Cart'

    expect(page).to_not have_button('Checkout')
    expect(page).to have_content('Login or Create Account to Checkout')
    expect(page).to have_content ('Toy')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ('cold')

    within('.container') do
      click_on 'Login'
    end

    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(current_path).to eq(cart_path)
    expect(page).to have_content('Your Cart')
    expect(page).to have_content ('Toy')
    expect(page).to have_css ('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content ('$0.99')
    expect(page).to have_content ('cold')
    expect(page).to have_button ('Checkout')

    click_on 'Logout'

    expect(page).to have_content('Login')
    expect(page).to_not have_button('Checkout')
  end
end
