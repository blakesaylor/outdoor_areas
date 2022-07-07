class Climb < ApplicationRecord
    belongs_to :area
    validates_presence_of :name 
    validates :lead, inclusion: [true, false]
    validates :sport, inclusion: [true, false]
    validates :trad, inclusion: [true, false]
    validates :top_rope, inclusion: [true, false]
    validates_presence_of :grade 
    validates_presence_of :pitches 
end