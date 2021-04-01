class Condition < ApplicationRecord
    belongs_to :treatment
    belongs_to :piece

    validates_presence_of :description, :date_time
end