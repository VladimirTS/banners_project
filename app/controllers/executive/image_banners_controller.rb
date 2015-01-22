class ImageBannersController < ApplicationController
  before_action :find_banner, except: [:new, :create]

  def show; end

  def new
    @image_banner = ImageBanner.new
  end

  def create
    @image_form = ImageForm.new(image_banner_params)

    if @image_form.save
      redirect_to @image_form.banner
    else
      @image_banner = @image_form.banner
      render "new"
    end
  end

  def edit; end

  def update
    @image_form = ImageForm.new(@image_banner)

    if @image_form.update_attributes(image_banner_params)
      redirect_to @image_form.banner
    else
      @image_banner = @image_form.banner
      render "edit"
    end
  end

  def destroy
    @image_banner.destroy
    redirect_to "/admin"
  end

  # increase count click and redirect on necessary url
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
                                           :url,        :positions => [])
    end


end