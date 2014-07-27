class HtmlBannersController < ApplicationController

  def index

  end

  def show
    @html_banner = HtmlBanner.find(params[:id])
  end

  def new
    @html_banner = HtmlBanner.new
  end

  def create
    @html_banner = HtmlBanner.new(html_banner_params)

    if @html_banner.save
      add_position_to_banner
      redirect_to @html_banner
    else
      render "new"
    end
  end

  def edit
    @html_banner = HtmlBanner.find(params[:id])
  end

  def update
    @html_banner = HtmlBanner.find(params[:id])

    remove_old_positions(@html_banner)

    if @html_banner.update_attributes(html_banner_params)
      add_position_to_banner
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

  def html_banner_params
    params.require(:html_banner).permit(:controller, :property_type,
                                        :deal_kind,  :deal_direction,
                                        :action,     :html)
  end

  def add_position_to_banner
    if params[:html_banner][:positions]
      params[:html_banner][:positions].each do |position|
        Position.create(banner_id: @html_banner.id, value: position)
      end
    end
  end

  def remove_old_positions(obj_banner)
    obj_banner.banner.positions.each do |position|
      position.destroy
    end
  end
end