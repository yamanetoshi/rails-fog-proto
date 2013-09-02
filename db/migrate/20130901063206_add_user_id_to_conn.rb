class AddUserIdToConn < ActiveRecord::Migration
  def change
    add_column :conns, :user_id, :integer
  end
end
