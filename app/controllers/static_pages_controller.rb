class StaticPagesController < ApplicationController

  def home
    @page_title = "Home"
  end

  def help
    @page_title = "Help"
  end
end