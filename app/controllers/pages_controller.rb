# frozen_string_literal: true

class PagesController < ApplicationController
  def about
    @about_title = Page.find(1).title
    @about_content = Page.find(1).content
  end

  def contact
    @contact_title = Page.find(2).title
    @contact_content = Page.find(2).content
  end
end
