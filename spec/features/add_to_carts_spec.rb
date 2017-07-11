require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99
      )
    end
  end
  scenario 'User should be alble to add to cart after signing in' do
    visit '/signup'
    expect(page).not_to have_link 'Logout', href: '/logout'
    expect(page).not_to have_content "My Cart (0)"
    page.fill_in 'user[first_name]', :with => 'a'
    page.fill_in 'user[last_name]', with: 'a'
    page.fill_in 'user[email]', with: 'a@a'
    page.fill_in 'user[password]', with: 'aaaaaa'
    page.fill_in 'user[password_confirmation]', with: 'aaaaaa'
    page.click_on 'Submit'
    expect(page).to have_link 'Logout', href: '/logout'
    page.first('a', :text => 'Add').click
    expect(page).to have_content "My Cart (1)"
    puts page.html
  end
end
