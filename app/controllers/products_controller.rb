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

  # Add a product by id to my cart array in session
  # POST /product/:id/add_to_shopping_cart
  def add_to_shopping_cart
    id = params[:id].to_i
    unless session[:product_id].include?(id)
      session[:product_id] << id
      #session[:quantity] << Product.find(params[:id]).price
    end

    redirect_to action: 'show', id: params[:id]
  end
end
