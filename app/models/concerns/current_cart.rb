module CurrentCart

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])  #cart is updated till the session hasn't expireds
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end