require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do
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
  scenario "User can see product details" do
    # ACT
    #visit '/products/1'
    visit '/products/2'

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
    expect(page).to have_content('Reviews')
  end
end
