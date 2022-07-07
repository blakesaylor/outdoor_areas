class AddAreaToClimbs < ActiveRecord::Migration[5.2]
  def change
    add_column :climbs, :area, :reference
  end
end
