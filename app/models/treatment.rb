class Treatment < ApplicationRecord
    has_many :conditions
    has_many :pieces, through: :conditions
end