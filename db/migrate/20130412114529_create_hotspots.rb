class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :name, :null => false, :limit => 128
      t.string :group, :limit => 128
      t.string :category, :null => false, :limit => 128

      t.timestamps
    end
    add_index :hotspots, :name, :unique => true
    add_index :hotspots, :category
  end
end

