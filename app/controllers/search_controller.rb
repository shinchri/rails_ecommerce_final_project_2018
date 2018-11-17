# frozen_string_literal: true

class SearchController < ApplicationController
  def index; end

  def results
    @products = if params[:type].empty?
      Product.where('name like ?', "%#{params[:q]}%")
    else
      Product.where('name like ?', "%#{params[:q]}%").where(type_id: params[:type])
    end
  end
end
