module ApplicationHelper

  def get_array_positions(entity)
    entity.banner.positions.map(&:value)
  end

  def get_hash_controllers
    @controllers = {}

    ApplicationController.subclasses.each do |controller|
      @controllers[controller] = controller.action_methods.collect{|a| a.to_s}
    end

    @controllers
  end

  def widget(banner)
    case banner.banner_type
    when "ImageBanner"
      @image_banner = ImageBanner.find(banner.banner_id)
      render "image_banners/part_banner"
    when "FlashBanner"
      render text: "FlashBanner"
    else
      @html_banner = HtmlBanner.find(banner.banner_id)
      render "html_banners/part_banner"
    end
  end
end