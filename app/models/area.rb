class Area < ApplicationRecord
    has_many :climbs, dependent: :destroy
    validates_presence_of :name 
    validates_presence_of :state 
    validates :rock_climbing, inclusion: [true, false]
    validates_presence_of :elevation 
    validates_presence_of :latitude 
    validates_presence_of :longitude 

    def self.sort_by_created_datetime
        order(created_at: :desc)
    end

    def count_of_climbs
        climbs.count
    end

    def self.filter_by_name_exact(exact_name)
        where("name LIKE '#{exact_name}'")
    end
end