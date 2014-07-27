class AdminController < ApplicationController

  def index
    @banners = Banner.all
  end
end