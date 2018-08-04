class Seller < ApplicationRecord
	
	before_destroy :not_referenced
	belongs_to :user, optional: true
	has_many :cart_items
    mount_uploader :image, ImageUploader #uploading image
	serialize :image, JSON  #for SQlite

	has_many :comments, dependent: :destroy
	

	validates  :category, :model, :brand, :price, presence: true
	validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. "}
    validates :price, numericality: { only_integer: true }, length: { maximum: 7} 

 #array
    CATEGORY =  %w{Earphones Headphones Mobile Speakers}
	BRAND = %w{ 1More Acer Apple Beats BlackBerry Boat Bose Denon Honor HTC JBL Lava Logitech Motorola OnePlus Philips Redmi Samsung Sennheisers Skullcandy Sony }
	CONDITION = %w{ New Excellent Used Fair Poor }

	private

	 def not_referenced   #tells that don't throw error if the cart is empty
	 	unless cart_items.empty?
	 		errors.add(:base, "items are present")
	 		throw :abort
	 	end
	

end



end
