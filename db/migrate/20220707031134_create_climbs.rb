class CreateClimbs < ActiveRecord::Migration[5.2]
  def change
    create_table :climbs do |t|
      t.string :name
      t.boolean :lead
      t.boolean :sport
      t.boolean :trad
      t.boolean :top_rope
      t.integer :class
      t.integer :grade
      t.integer :pitches
      t.timestamps
    end
  end
end
