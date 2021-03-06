class Treatment < ApplicationRecord
    has_many :conditions
    has_many :pieces, through: :conditions

    accepts_nested_attributes_for :conditions 

    validates_presence_of :description, :date_time

    def parse_time
        self.date_time.strftime("%d %B, %Y")
    end
end