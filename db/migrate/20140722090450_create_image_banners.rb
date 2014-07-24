class CreateImageBanners < ActiveRecord::Migration
  def change
    create_table :image_banners do |t|
      t.string :url
      t.string :click_count
    end

    add_attachment :image_banners, :file
  end
end
