class Piece < ApplicationRecord
    belongs_to :user
    has_many :conditions
    has_many :treatments, through: :conditions

    validates_presence_of :title, :artist, :description
    validates_uniqueness_of :title, :description

    def self.all_artists
        all.map{|piece| piece.artist}.uniq
    end

    def self.by_artist(artist)
        where(artist: artist)
    end

    def self.alphabetical_by_title
        all.order(title: :asc)
    end

    def self.reverse_alphabetical_by_title
        all.order(title: :desc)
    end

end
