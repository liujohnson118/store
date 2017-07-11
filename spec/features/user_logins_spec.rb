require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  scenario 'User can sign up for an account and redirect to root ' do
    visit '/signup'
    expect(page).not_to have_link 'Logout', href: '/logout'
    expect(page).not_to have_content "My Cart"
    page.fill_in 'user[first_name]', :with => 'a'
    page.fill_in 'user[last_name]', with: 'a'
    page.fill_in 'user[email]', with: 'a@a'
    page.fill_in 'user[password]', with: 'aaaaaa'
    page.fill_in 'user[password_confirmation]', with: 'aaaaaa'
    page.click_on 'Submit'
    expect(page).to have_link 'Logout', href: '/logout'
    expect(page).to have_content "My Cart"
  end
end
