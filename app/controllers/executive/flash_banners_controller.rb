class FlashBannersController < ApplicationController
  before_action :find_banner, except: [:new, :create]

  def show; end

  def new
    @flash_banner = FlashBanner.new
  end

  def create
    @flash_form = FlashForm.new(flash_banner_params)

    if @flash_form.save
      redirect_to @flash_form.banner
    else
      @flash_banner = @flash_form.banner
      render "new"
    end
  end

  def edit; end

  def update
    @flash_form = FlashForm.new(@flash_banner)

    if @flash_form.update_attributes(flash_banner_params)
      redirect_to @flash_form.banner
    else
      @flash_banner = @flash_form.banner
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
                                           :action,     :file,
                                           :positions => [])
    end
end