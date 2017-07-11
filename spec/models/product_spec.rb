require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'validates presence of product name' do
      @category = Category.create!(name: 'car')
      product_nil_name=@category.products.new(name:nil,price: 1000, quantity: 15)
      product_nil_name.save
      expect(product_nil_name.errors.full_messages).to include("Name can't be blank")
    end
    it 'validates numericality of product price' do
      @category = Category.create!(name: 'book')
      product_nil_name=@category.products.new(name:'math_book',price: '10a', quantity: 15)
      product_nil_name.save
      expect(product_nil_name.errors.full_messages).to include("Price is not a number")
    end
    it 'validates integer numericality of product quantity' do
      @category = Category.create!(name: 'Food')
      product_nil_name=@category.products.new(name:'Cha Shu Bum',price: 5, quantity: 15.2)
      product_nil_name.save
      expect(product_nil_name.errors.full_messages).to include("Quantity must be an integer")
    end
    it 'validates integer numericality of product category' do
      product_nil_name=Product.new(name:'peking duck',price: 5, quantity: 15)
      product_nil_name.save
      expect(product_nil_name.errors.full_messages).to include("Category can't be blank")
    end
    it 'validates successful creation of product' do
      @category = Category.create!(name: 'bicycle')
      my_bike = @category.products.new(name: 'Giant', price: 150, quantity: 1)
      my_bike.save
      expect(my_bike[:name].length).to be > 1
      expect(my_bike.price).to eql(150)
      expect(my_bike.quantity).to eql(1)
    end
  end
end