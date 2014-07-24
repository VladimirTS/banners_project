class CreateFlashBanners < ActiveRecord::Migration
  def change
    create_table :flash_banners do |t|

    end

    add_attachment :flash_banners, :file
  end
end
