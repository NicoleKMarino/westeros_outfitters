# As a visitor
# When I visit "/:CATEGORY_NAME"
# I see all items assigned to that category
require 'rails_helper'

RSpec.feature "Visitor views all items in category" do
  scenario "they see the names of each item" do
    category = Category.create(name: "Weapons")

    items = %w(Sword Shield Bow).map do |item_name|
      category.items.create(name: item_name, img: "https://pbs.twimg.com/profile_images/715136295933255680/5XIOqSKw.jpg", price: 9.99)
    end

    visit category_path(category)

    expect(page).to have_content("Sword")
    expect(page).to have_content("Shield")
    expect(page).to have_content("Bow")
  end
end
