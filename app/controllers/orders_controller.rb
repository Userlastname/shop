class OrdersController < ApplicationController
  def show;end

  def create
    if user_signed_in?
      @order = Order.create(user_id: current_user.id, ordered_at: DateTime.current, status: "Completed")
      products_id = current_user.cart.cart_products.pluck(:product_id)
      products_id.each do |item|
        @products_order = OrderProduct.create(order_id: @order.id, product_id: item, amount: 1)
      end
      address = Address.new(address_params)
      address.user_id = current_user.id
      address.save
      @order_detail = OrderDetail.new(address_id: address.id, order_id: @order.id)
      @order_detail.save
      redirect_to root_path
    elsif @current_cart.present?
      @order = Order.create(ordered_at: DateTime.current, status: "Completed")
      session[:cart_id].each do |product_id|
        @products_order = ProductOrder.create(order_id: @order.id, product_id: product_id)
      end
      address = Address.create(address_params)
      @order_detail = OrderDetail.new(order_detail_params)
      @order_detail.order_id = @order.id
      @order_detail.address_id = address.id
      @order_detail.save
    end
    redirect_to root_path
  end

  private

  def cart_empty;end

  def resource
    current_user.orders.find(params[:id])
  end

  def order_detail_params
    params
    .require(:order_detail)
    .permit(:first_name, :last_name, :email)
  end

  def address_params
    params
    .require(:address)
    .permit(:country, :city, :street, :comment)
  end
end
