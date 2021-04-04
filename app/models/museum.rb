class Museum < ApplicationRecord
    belongs_to :user

    validates_presence_of :name, :location
    validates_uniqueness_of :name
end