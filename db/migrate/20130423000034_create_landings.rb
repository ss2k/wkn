class CreateLandings < ActiveRecord::Migration
  def change
    create_table :landings do |t|
      t.integer :hotspot_id, :null => false
      t.string :title, :null => false
      t.text :markup, :null => false, :default => ''

      t.timestamps
    end
    add_index :landings, [:hotspot_id, :title], :unique => true
  end
end

