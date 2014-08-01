class HtmlBannersController < ApplicationController
  before_action :find_banner, except: [:new, :create]

  def show; end

  def new
    @html_banner = HtmlBanner.new
  end

  def create
    @html_form = HtmlForm.new(html_banner_params)

    if @html_form.save
      redirect_to @html_form.banner
    else
      @html_banner = @html_form.banner
      render "new"
    end
  end

  def edit; end

  def update
    @html_form = HtmlForm.new(@html_banner)

    if @html_form.update_attributes(html_banner_params)
      redirect_to @html_form.banner
    else
      @html_banner = @html_form.banner
      render "edit"
    end
  end

  def destroy
    HtmlForm(@html_banner).destroy
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
                                          :action,     :html,
                                          :positions => [])
    end
end