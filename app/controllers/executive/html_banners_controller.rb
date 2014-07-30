class HtmlBannersController < ApplicationController
  before_action :find_banner, except: [:new, :create]

  def show; end

  def new
    @html_banner = HtmlBanner.new
  end

  def create
    @html_banner = HtmlBanner.new(html_banner_params)

    if @html_banner.save
      Banner.add_positions(params[:html_banner][:positions], @html_banner.banner.id)
      redirect_to @html_banner
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @html_banner.update_attributes(html_banner_params)
      Banner.remove_positions(@html_banner)
      Banner.add_positions(params[:html_banner][:positions], @html_banner.banner.id)
      redirect_to @html_banner
    else
      render "edit"
    end
  end

  def destroy
    @html_banner = HtmlBanner.find(params[:id])
    @html_banner.destroy
    redirect_to "/admin"
  end

  private

    def find_banner
      begin
        @html_banner = HtmlBanner.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to "/"
      end
    end

    def html_banner_params
      params.require(:html_banner).permit(:controller, :property_type,
                                          :deal_kind,  :deal_direction,
                                          :action,     :html)
    end
end