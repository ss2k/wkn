class RenameEditableIdToHotspotIdAndRemoveEditableTypeFromEditorships < ActiveRecord::Migration
  def up
    rename_column :editorships, :editable_id, :hotspot_id
    remove_column :editorships, :editable_type
    add_index :editorships, [:user_id, :hotspot_id], :unique => true
  end

  def down
    rename_column :editorships, :hotspot_id, :editable_id
    add_column :editorships, :editable_type, :string
    add_index :editorships, [:user_id, :editable_id, :editable_type], :unique => true
  end
end

