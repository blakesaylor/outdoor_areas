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

    def self.filter_by_pitches(filter_value)
        where("pitches >= #{filter_value}")
    end

    def self.filter_by_name_exact(exact_name)
        where("name LIKE '#{exact_name}'")
    end
end