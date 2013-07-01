class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :description
      t.string :category
      t.string :user_id
      t.boolean :resolved

      t.timestamps
    end
  end
end
