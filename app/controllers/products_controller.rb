class ProductsController < ApplicationController
  def index
    #@products = Product.all
    @products = Product.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end
end
