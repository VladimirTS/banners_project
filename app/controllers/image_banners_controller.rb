class ImageBannersController < ApplicationController
  before_action :find_banner, only: [:show, :edit, :update, :destroy, :inc_click_count_and_redir_url]

  def index

  end

  def show; end

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

  def edit; end

  def update
    remove_old_positions(@image_banner)

    if @image_banner.update_attributes(image_banner_params)
      add_position_to_banner
      redirect_to @image_banner
    else
      render "edit"
    end
  end

  def destroy
    @image_banner.destroy
    redirect_to "/admin"
  end

  # increment count click and redirect on necessary url
  def inc_click_count_and_redir_url
    @image_banner.increment!(:click_count)
    redirect_to @image_banner.url
  end

  private

    def find_banner
      begin
        @image_banner = ImageBanner.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to "/"
      end
    end

    def image_banner_params
      params.require(:image_banner).permit(:controller, :property_type,
                                           :deal_kind,  :deal_direction,
                                           :action,     :file,
                                           :url)
    end

    def add_position_to_banner
      if params[:image_banner][:positions]
        params[:image_banner][:positions].each do |position|
          Position.create(banner_id: @image_banner.banner.id, value: position)
        end
      end
    end

end