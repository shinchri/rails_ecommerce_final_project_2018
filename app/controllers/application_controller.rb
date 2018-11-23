# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_levels
  before_action :initialize_session
  before_action :load_shopping_items

  private
  def load_levels
    @levels_for_nav = Level.all
    @types_for_nav = Type.all
  end

  def initialize_session
    session[:product_id] ||= []
    session[:quantity] ||= []
  end

  def load_shopping_items
    @cart_items = Product.find(session[:product_id])
  end
end
