class CreateConns < ActiveRecord::Migration
  def change
    create_table :conns do |t|
      t.string :access_key
      t.string :secret_access_key
      t.string :end_point

      t.timestamps
    end
  end
end
