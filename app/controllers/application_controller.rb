class ApplicationController < ActionController::Base
  before_action :load_levels

  private
  def load_levels
    @levels_for_nav = Level.all
  end
end
