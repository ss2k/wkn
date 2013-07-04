class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :ticket_id
      t.integer :user_id
      t.text :answer

      t.timestamps
    end
  end
end
