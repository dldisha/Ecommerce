module ApplicationHelper

	def cart_count_over_one
    if @cart.cart_items.count > 0
      return "<span class='tag is-dark'>#{@cart.cart_items.count}</span>".html_safe
    end
  end

  def cart_has_items
    return @cart.cart_items.count > 0
  end


  def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://caravetclinic.com/wp/wp-content/uploads/2016/07/person-icon-blue.png"
    image_tag(gravatar_url, alt: user.name, class: "border-radius-50", width:"35px")
  end

  def markdown_to_html(text)
    Kramdown::Document.new(text, input: "GFM").to_html
  end

  

end
