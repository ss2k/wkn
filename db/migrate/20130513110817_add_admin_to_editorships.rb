class AddAdminToEditorships < ActiveRecord::Migration
  def change
    add_column :editorships, :admin, :boolean, :null => false, :default => false
  end
end

