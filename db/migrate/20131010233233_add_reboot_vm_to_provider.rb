class AddRebootVmToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :reboot_vm, :string
  end
end
