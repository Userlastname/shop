# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super

    link_cart_to_user
  end

  private

  def link_cart_to_user
    return if session[:cart_id].blank?

    cart = Cart.find(session[:cart_id])
    cart.update(user: current_user)
  end
end
