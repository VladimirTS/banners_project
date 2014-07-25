class CreateHtmlBanners < ActiveRecord::Migration
  def change
    create_table :html_banners do |t|
      t.string :html
    end
  end
end
