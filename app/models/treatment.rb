class Treatment < ApplicationRecord
    has_many :conditions
    has_many :pieces, through: :conditions

    validates_presence_of :description, :date_time
end