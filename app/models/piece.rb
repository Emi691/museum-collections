class Piece < ApplicationRecord
    belongs_to :user
    belongs_to :museum
    has_many :conditions
    has_many :treatments, through: :conditions

    validates_presence_of :title, :artist, :description
    validates_uniqueness_of :title, :description

    accepts_nested_attributes_for :treatments
end
