class FlashBannersController < ApplicationController
  before_action :find_banner, except: [:new, :create]

  def show; end

  def new
    @flash_banner = FlashBanner.new
  end

  def create
    @flash_banner = FlashBanner.new(flash_banner_params)

    if @flash_banner.save
      Banner.add_positions(params[:flash_banner][:positions], @flash_banner.banner.id)
      redirect_to @flash_banner
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @flash_banner.update_attributes(flash_banner_params)
      Banner.remove_positions(@flash_banner)
      Banner.add_positions(params[:flash_banner][:positions], @flash_banner.banner.id)
      redirect_to @flash_banner
    else
      render "edit"
    end
  end

  def destroy
    @flash_banner.destroy
    redirect_to "/admin"
  end

  private

    def find_banner
      begin
        @flash_banner = FlashBanner.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to "/"
      end
    end

    def flash_banner_params
      params.require(:flash_banner).permit(:controller, :property_type,
                                           :deal_kind,  :deal_direction,
                                           :action,     :file, :positions)
    end
end