class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def choose_banners
    @banner_positions = Banner.get_banners(params)
    render "test/all_record"
  end

  def remove_old_positions(banner_type)
    banner_type.banner.positions.each do |position|
      position.destroy
    end
  end
end
