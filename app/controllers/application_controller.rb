# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_levels

  private
  def load_levels
    @levels_for_nav = Level.all
    @types_for_nav = Type.all
  end
end
