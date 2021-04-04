class Condition < ApplicationRecord
    belongs_to :treatment, optional: true
    belongs_to :piece, optional: true

    #validates_presence_of :description, :date_time
end