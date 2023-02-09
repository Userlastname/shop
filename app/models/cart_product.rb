class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :ordered, -> { order(position: :desc) }

  def total_price
    self.quantity * self.product.price
  end
end
