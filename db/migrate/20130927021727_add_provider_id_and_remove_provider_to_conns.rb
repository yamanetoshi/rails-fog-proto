class AddProviderIdAndRemoveProviderToConns < ActiveRecord::Migration
  def change
    add_column :conns, :provider_id, :integer
    remove_column :conns, :provider
  end
end
