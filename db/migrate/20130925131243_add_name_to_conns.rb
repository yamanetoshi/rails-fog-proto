class AddNameToConns < ActiveRecord::Migration
  def change
    add_column :conns, :name, :string
  end
end
