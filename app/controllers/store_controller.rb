
class StoreController < ApplicationController
  include CurrentCart
  #before_action :authorize

  def index
    authorize! :read, Product
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
