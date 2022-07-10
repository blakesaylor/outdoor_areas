class Climb < ApplicationRecord
    belongs_to :area
    validates_presence_of :name
    validates :top_rope, inclusion: [true, false]
    validates_presence_of :grade 
    validates_presence_of :pitches 

    def self.show_top_ropeable
        where(top_rope: true)
    end

    def self.alphabetical
        order(:name)
    end
end