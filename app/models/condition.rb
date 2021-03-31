class Condition < ApplicationRecord
    belongs_to :treatment
    belongs_to :piece
end