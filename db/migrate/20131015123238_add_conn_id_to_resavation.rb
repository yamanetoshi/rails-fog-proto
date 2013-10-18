class AddConnIdToResavation < ActiveRecord::Migration
  def change
    add_column :resavations, :conn_id, :integer
  end
end
