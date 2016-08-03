# Background: an existing item
# As an admin
# When I visit "admin/items"
# And I click "Edit"
# Then my current path should be "/admin/items/:ITEM_ID/edit"
# And I should be able to upate title, description, image, and status
require 'rails_helper'

RSpec.feature 'Admin can edit an existing item' do
  scenario 'they can edit an item with valid attributes' do
    category = Category.create!(name: 'weapons')
    item = category.items.create!(id: 1, name: 'Ice', img: 'fake_image', price: 0.99, description: 'this is a description', retired: false)
    admin = User.create!(id: 1, username: 'Hodor', password: 'holddoor', address: 'The Woods', email: 'hold@thedoor.com', role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit item_path(item)

    expect(page).to have_button('Add to Cart')

    click_on 'Edit This Item'
    expect(current_path).to eq("/admin/items/#{item.id}/edit")

    within '#retired-status' do
      choose 'Retired'
    end
    fill_in 'Name', with: 'Water'
    fill_in 'Image', with: 'http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg'
    fill_in 'Price', with: 3.00
    fill_in 'Description', with: 'It got warm and the Ice melted.'
    click_button 'Submit'

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content('Successfully Updated Item!')
    expect(page).to have_content('Water')
    expect(page).to have_css('img[src="http://www.valyriansteel.com/shop/images/uploads/ice-main.jpg"]')
    expect(page).to have_content('$3.00')
    expect(page).to have_content('It got warm and the Ice melted.')
    expect(page).to_not have_button('Add to Cart')
  end

  scenario 'they cannot edit an item without valid attributes' do
    category = Category.create!(name: 'weapons')
    item = category.items.create!(id: 1, name: 'Ice', img: 'fake_image', price: 0.99, description: 'this is a description', retired: false)
    admin = User.create!(id: 1, username: 'Hodor', password: 'holddoor', address: 'The Woods', email: 'hold@thedoor.com', role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit edit_admin_item_path(item)

    expect(current_path).to eq("/admin/items/#{item.id}/edit")

    fill_in 'Name', with: ''
    fill_in 'Image', with: ''
    fill_in 'Description', with: ''
    click_button 'Submit'

    expect(page).to have_content("Name can't be blank. Img can't be blank. Description can't be blank")
    expect(page).to have_content('Edit Item')
  end
end
