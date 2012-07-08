class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.references :user
      t.integer :latitude
      t.integer :longitude
      
      t.timestamps
    end
  end
end
