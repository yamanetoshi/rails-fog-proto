class AddCreateVmAndStartVmAndStopVmToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :create_vm, :string
    add_column :providers, :start_vm, :string
    add_column :providers, :stop_vm, :string
  end
end
