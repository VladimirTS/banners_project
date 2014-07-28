class FlashBannersController < ApplicationController
  before_action :find_banner, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show; end

  def new
    @flash_banner = FlashBanner.new
  end

  def create
    @flash_banner = FlashBanner.new(flash_banner_params)

    if @flash_banner.save
      add_position_to_banner
      redirect_to @flash_banner
    else
      render "new"
    end
  end

  def edit; end

  def update
    remove_old_positions(@flash_banner)

    if @flash_banner.update_attributes(flash_banner_params)
      add_position_to_banner
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

    def add_position_to_banner
      if params[:flash_banner][:positions]
        params[:flash_banner][:positions].each do |position|
          Position.create(banner_id: @flash_banner.id, value: position)
        end
      end
    end

    def remove_old_positions(banner_type)
      banner_type.banner.positions.each do |position|
        position.destroy
      end
    end
end