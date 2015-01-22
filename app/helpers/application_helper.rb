module ApplicationHelper

  def get_array_positions(entity)
    entity.positions.map(&:value)
  end

  def all_controllers
    Rails.cache.read("controllers")
  end

  def widget(banner)
    banner.increment!(:count_display)

    case banner.producible_type
    when "ImageBanner"
      @image_banner = ImageBanner.find(banner.producible_id)
      render "image_banners/part_banner"
    when "FlashBanner"
      @flash_banner = FlashBanner.find(banner.producible_id)
      render "flash_banners/part_banner"
    else
      @html_banner = HtmlBanner.find(banner.producible_id)
      render "html_banners/part_banner"
    end
  end
end
