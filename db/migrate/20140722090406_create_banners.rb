class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners, :as_relation_superclass => true do |t|
      t.integer :producible_id
      t.string  :producible_type
      t.string  :controller
      t.string  :action
      t.string  :property_type
      t.string  :deal_kind
      t.string  :deal_direction
      t.integer :count_display
    end
  end
end
