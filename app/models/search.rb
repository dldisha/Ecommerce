class Search < ApplicationRecord
	

   def search_sellers

   	sellers = Seller.all
   	
   	sellers = sellers.where(["category LIKE ?", category]) if category.present?
   	sellers = sellers.where(["brand LIKE ?",brand]) if brand.present?
   	sellers = sellers.where(["price >= ?", min_price]) if min_price.present?
   	sellers = sellers.where(["price <= ?", max_price]) if max_price.present?
   	
   	return sellers
   	end

end
