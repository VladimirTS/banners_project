class CreateBannersPositions < ActiveRecord::Migration
  def change
    create_table :banners_positions, id: false do |t|
      t.integer :banner_id
      t.integer :position_id
    end
  end
end
