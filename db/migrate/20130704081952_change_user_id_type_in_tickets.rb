class ChangeUserIdTypeInTickets < ActiveRecord::Migration
  def up
    change_column :tickets, :user_id, :integer
  end

  def down
  end
end
