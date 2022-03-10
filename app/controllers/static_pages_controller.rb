class StaticPagesController < ApplicationController

  def home
    @page_title = "Home"
  end

  def help
    @page_title = "Help"
  end

  def contact
    @page_title = "ContactUs"
  end
end