class CreateEditorships < ActiveRecord::Migration
  def change
    create_table :editorships do |t|
      t.integer :user_id, :null => false
      t.integer :editable_id, :null => false
      t.string :editable_type, :null => false

      t.timestamps
    end
    add_index :editorships, [:user_id, :editable_id, :editable_type], :unique => true
  end
end

