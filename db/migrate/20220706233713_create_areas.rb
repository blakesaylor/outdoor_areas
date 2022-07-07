class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :state
      t.boolean :rock_climbing
      t.integer :elevation
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end