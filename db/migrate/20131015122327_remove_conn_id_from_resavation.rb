class RemoveConnIdFromResavation < ActiveRecord::Migration
  def up
    remove_column :resavations, :conn_id
  end

  def down
  end
end
