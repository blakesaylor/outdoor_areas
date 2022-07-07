class AddAreaToClimbs < ActiveRecord::Migration[5.2]
  def change
    add_reference :climbs, :area, foreign_key: true
  end
end
