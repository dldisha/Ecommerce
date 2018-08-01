class CartItem < ApplicationRecord
  belongs_to :seller
  belongs_to :cart

    def total_price
    seller.price.to_i * quantity.to_i
  end

end
