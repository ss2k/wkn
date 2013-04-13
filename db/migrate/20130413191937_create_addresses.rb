class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1, :null => false
      t.string :address2
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :country, :null => false
      t.string :postal_code, :null => false
      t.integer :addressable_id, :null => false
      t.string :addressable_type, :null => false

      t.timestamps
    end
    add_index :addresses, :address1
    add_index :addresses, :city
    add_index :addresses, :state
    add_index :addresses, :postal_code
  end
end

