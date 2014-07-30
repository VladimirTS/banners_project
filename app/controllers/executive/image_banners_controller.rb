class ImageBannersController < ApplicationController
  before_action :find_banner, except: [:new, :create]

  def show; end

  def new
    @image_banner = ImageBanner.new
  end

  def create
    @image_banner = ImageBanner.new(image_banner_params)

    if @image_banner.save
      Banner.add_positions(params[:image_banner][:positions], @image_banner.banner.id)
      redirect_to @image_banner
    else
      render "new"
    end
  end

  def edit; end

  def update

    if @image_banner.update_attributes(image_banner_params)
      Banner.remove_positions(@image_banner)
      Banner.add_positions(params[:image_banner][:positions], @image_banner.banner.id)
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


end