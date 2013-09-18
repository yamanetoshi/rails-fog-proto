class CreateVirtualMachines < ActiveRecord::Migration
  def change
    create_table :virtual_machines do |t|

      t.timestamps
    end
  end
end
