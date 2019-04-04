
class StoreController < ApplicationController
  include CurrentCart
  #before_action :authorize

  def index
    if params[:set_locale]
      redirect_to store_index_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
