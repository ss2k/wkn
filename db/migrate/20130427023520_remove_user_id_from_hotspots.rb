class RemoveUserIdFromHotspots < ActiveRecord::Migration
  def up
    remove_column :hotspots, :user_id
  end

  def down
    add_column :hotspots, :user_id, :integer
  end
end

