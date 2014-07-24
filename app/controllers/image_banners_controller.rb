class ImageBannersController < ApplicationController

  def index

  end

  def show
    @image_banner = ImageBanner.find(params[:id])
  end

  def new
    @image_banner = ImageBanner.new
  end

  def create
    @image_banner = ImageBanner.new(image_banner_params)

    if @image_banner.save
      add_position_to_banner
      redirect_to @image_banner
    else
      render "new"
    end
  end

  def edit
    @image_banner = ImageBanner.find(params[:id])
  end

  def update
    @image_banner = ImageBanner.find(params[:id])

    remove_old_positions(@image_banner)

    if @image_banner.update_attributes(image_banner_params)
      add_position_to_banner
      redirect_to @image_banner
    else
      render "edit"
    end
  end

  def destroy
    @image_banner = ImageBanner.find(params[:id])
    @image_banner.destroy
  end

  private

    def image_banner_params
      params.require(:image_banner).permit(:controller,  :property_type,
                                           :deal_kind,   :deal_direction,
                                           :action_name, :file)
    end

    def add_position_to_banner
      if params[:image_banner][:positions]
        params[:image_banner][:positions].each do |position|
          Position.create(position: position, banner_id: @image_banner.id)
        end
      end
    end

    def remove_old_positions(obj_banner)
      obj_banner.banner.positions.each do |position|
        position.destroy
      end
    end
end