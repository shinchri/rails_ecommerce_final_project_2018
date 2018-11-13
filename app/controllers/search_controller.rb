class SearchController < ApplicationController
  def index
  end

  def results
    if params[:type].empty?
      @products = Product.where("name like ?", "%#{params[:q]}%")
    else
      @products = Product.where("name like ?", "%#{params[:q]}%").where(type_id: params[:type])
    end
  end
end
