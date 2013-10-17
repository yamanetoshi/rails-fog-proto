class CreateResavations < ActiveRecord::Migration
  def change
    create_table :resavations do |t|
      t.string :operation
      t.string :hour
      t.string :min
      t.integer :vmid
      t.integer :conn_id

      t.timestamps
    end
  end
end
