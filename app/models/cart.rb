class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products, dependent: :destroy

  scope :ordered, -> { order(position: :desc) }

  def sub_total
    sum = 0
    self.cart_products.each do |item|
      sum+= item.total_price
    end
    sum
  end

  def clear_cart
    cart_products.destroy
  end
end
