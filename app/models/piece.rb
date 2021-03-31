class Piece < ApplicationRecord
    belongs_to :user
    belongs_to :museum
    has_many :conditions
    has_many :treatments, through: :conditions
end
