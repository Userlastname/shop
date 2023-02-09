class ApplicationController < ActionController::Base
  attr_accessor :current_cart
  before_action :initalize_cart

  def initalize_cart
    if user_signed_in?
      if current_user.cart.present?
        @current_cart = current_user.cart
      else
        @current_cart = Cart.create(user: current_user)
      end
    else
      if session[:cart_id].present?
        @current_cart = Cart.find(session[:cart_id])
      else
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
  end
end
