class CreateClimbs < ActiveRecord::Migration[5.2]
  def change
    create_table :climbs do |t|
      t.string :name
      t.boolean :top_rope
      t.string :grade
      t.integer :pitches
    end
  end
end
