class CartsController < ApplicationController
  def index
  end

  def clear_shopping_cart_lists
    session[:product_id] = []
    session[:quantity] = []
    redirect_to action: 'index'
  end
end
