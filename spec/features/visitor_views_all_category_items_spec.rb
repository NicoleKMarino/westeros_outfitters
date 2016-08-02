require 'rails_helper'

RSpec.feature 'Visitor views all items in category' do
  scenario 'they see the names of each item' do
    category = Category.create!(name: 'weapons')

    %w(Sword Shield Bow).map do |item_name|
      category.items.create!(name: item_name, img: "#{item_name}image", price: 9.99, description: "this is a description")
    end

    visit category_path(category)
    expect(page).to have_content('Sword')
    expect(page).to have_content('Shield')
    expect(page).to have_content('Bow')
  end
end
