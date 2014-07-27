class FlashBannersController < ApplicationController

  def index

  end

  def show
    @flash_banner = FlashBanner.find(params[:id])
  end

  def new
    @flash_banner = FlashBanner.new
  end

  def create
    @flash_banner = FlashBanner.new(flash_banner_params)

    if @flash_banner.save
      redirect_to @flash_banner
    else
      render "new"
    end
  end

  def edit
    @flash_banner = FlashBanner.find(params[:id])
  end

  def update
    @flash_banner = FlashBanner.find(params[:id])

    if @flash_banner.update_attributes(params[:banner])
      redirect_to @flash_banner
    else
      render "edit"
    end
  end

  def destroy
    @flash_banner = ImageBanner.find(params[:id])
    @flash_banner.destroy
    redirect_to "/admin"
  end

  private

    def flash_banner_params
      params.require(:flash_banner).permit(:controller,    :position,
                                           :property_type, :deal_kind,
                                           :deal_direction, :action,
                                           :file)
    end
end