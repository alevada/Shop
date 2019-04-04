
module CurrentCart

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    current_user.cart = @cart
    current_user.save
    session[:cart_id] = @cart.id
  end
end



