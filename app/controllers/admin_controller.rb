

class AdminController < ApplicationController

  def index
    authorize! :read, User
    @total_orders = Order.count
  end
end
