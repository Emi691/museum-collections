class PiecesController < ApplicationController

    def index
        @pieces = Piece.all
    end

    def show 
        @piece = Piece.find_by(id: params[:id])
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def piece_params
        params.require(:piece).permit(:title, :artist, :description, :medium, :dimensions, :weight, :location, :provenance, :appraised_value, :notes, :treatment[:id], :treatment[:decription, :date_time])
    end
end
