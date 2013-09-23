class AddProviderToConn < ActiveRecord::Migration
  def change
    add_column :conns, :provider, :string
  end
end
