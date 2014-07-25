class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :banner_id
      t.string  :value
    end
  end
end
