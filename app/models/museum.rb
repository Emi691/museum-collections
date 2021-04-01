class Museum < ApplicationRecord
    has_many :pieces
    has_many :users, through: :pieces

    validates_presence_of :name, :location
    validates_uniqueness_of :name
end