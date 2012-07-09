class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.references :user
      t.string :latitude
      t.string :longitude
      t.references :location
      
      t.timestamps
    end
  end
end
