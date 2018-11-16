# frozen_string_literal: true

class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    @products = @products.is_new(params[:is_new]) if params[:is_new].present?
    @products = @products.on_sale(params[:on_sale]) if params[:on_sale].present?
  end

  def show
    @product = Product.find(params[:id])
  end
end
