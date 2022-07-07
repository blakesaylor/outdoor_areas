class Area < ApplicationRecord
    has_many :climbs

    def self.sort_by_created_datetime
        order(created_at: :desc)
    end
end