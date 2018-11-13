class SearchController < ApplicationController
  def index
  end

  def results
    @products = Product.where("name like ?", "%#{params[:q]}%")
  end
end
