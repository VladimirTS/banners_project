class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string  :value
    end
  end
end
