class ProductsController < ApplicationController

  def index
    puts "users products ----------------------------"
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end
  
end
