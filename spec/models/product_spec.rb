require 'rails_helper'

#Price is not a number
# Quantity can't be blank
# Category can't be blank
# Name can't be blank

# describe '.save' do
#   it "a product with all four fields set will save successfully" do
#     @category = Category.new(name: "Cat food")
#     @category.save

#     @product = Product.new(name: "Wiskas", price: 1000, quantity: 25, category: @category)
#     @product.save
#     expect(@product).to be_valid
#   end
# end
RSpec.describe Product, type: :model do
  before(:all) do
    @category = Category.new(name: "Cat food")
    @product = Product.new(name: "Wiskas", price: 1000, quantity: 25, category: @category)
    @product.save
  end
  
  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end

  it "is not valid without a title" do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eql(["Name can't be blank"])
  end

  it "is not valid without a description" do
    @product.price = nil
    expect(@product).to_not be_valid
  end

  it "is not valid without a start_date" do
    @product.quantity = nil
    expect(@product).to_not be_valid
  end

  it "is not valid without a start_date" do
    @product.category = nil
    expect(@product).to_not be_valid
  end


end