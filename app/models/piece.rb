class Piece < ApplicationRecord
    belongs_to :user
    has_many :conditions
    has_many :treatments, through: :conditions

    validates_presence_of :title, :artist, :description
    validates_uniqueness_of :title, :description

    def self.all_artists
        all.map{|piece| piece.artist}.uniq
    end

    scope :by_artist, -> (artist) { where("artist= ?", artist) }

    scope :alphabetical_by_title, -> { order(title: :asc) }

    scope :reverse_alphabetical_by_title, -> { order(title: :desc) }
end
