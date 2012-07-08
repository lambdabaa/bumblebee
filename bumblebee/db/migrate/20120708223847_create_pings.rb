class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.references :user
      t.decimal :latitude,  :precision => 7, :scale => 4
      t.decimal :longitude, :precision => 7, :scale => 4
      
      t.timestamps
    end
  end
end
