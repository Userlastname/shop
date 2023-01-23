class ProductsController < ApplicationController
  def show
    render "home/show"
  end

  def cart 
    render "home/cart"
  end
end
