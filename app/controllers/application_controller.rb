class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def choose_banners
      @banner_positions = Banner.get_banners(params)
      render "test/all_record"
    end
end
