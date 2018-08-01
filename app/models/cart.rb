class Cart < ApplicationRecord
	has_many :cart_items, dependent: :destroy

	def add_seller(seller)  #no authentication in adding items to the cart
		current_item = cart_items.find_by(seller_id: seller.id) 
		if current_item
			current_item.increment(:quantity)
		else
		    current_item = cart_items.build(seller_id: seller.id)	
        end
        current_item
    end

      def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end


end
