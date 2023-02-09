class CartProductsController < ApplicationController
  def create
    item = Product.find(params[:product_id])
    if @current_cart.products.include?(item)
      @cart_product = @current_cart.cart_products.find_by(:product_id => item)
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(cart: @current_cart, product: item, quantity: 1)
    end
    @cart_product.save
  end

  def destroy_item
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_path
  end

  def add_quantity
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity += 1
    @cart_product.save
    redirect_to cart_path
  end

  def reduce_quantity
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity -= 1 if @cart_product.quantity > 1
    @cart_product.save
    redirect_to cart_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:cart_id,:product_id,:quantity)
  end
end
