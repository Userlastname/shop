class OrdersController < ApplicationController
  #soon
  private

  def order_deteil_params
    params.require(:order_detail).permit(:first_name, :last_name, :email)
  end

  def address_params
    params.require(:address).permit(:country, :city, :street, :comment)
  end
end
