class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :banner_id
      t.string  :banner_type
      t.string  :controller
      t.string  :action
      t.string  :property_type
      t.string  :deal_kind
      t.string  :deal_direction
      t.integer :count_display
    end
  end
end
