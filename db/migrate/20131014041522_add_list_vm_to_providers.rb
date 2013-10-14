class AddListVmToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :list_vm, :string
  end
end
