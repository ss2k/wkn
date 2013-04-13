class AddUserIdToHotspot < ActiveRecord::Migration
  def change
    add_column :hotspots, :user_id, :integer, :null => false
  end
end

