class PiecesController < ApplicationController

    def index
        @pieces = Piece.all
    end

    def show 
        @piece = Piece.find_by(id: params[:id])
    end

    def new
        @piece = Piece.new
    end

    def create
        @piece = Piece.new(piece_params)
        if @piece.save
            redirect_to pieces_path
        else
            redirect_to '/'
        end
    end

    def edit
        @piece = Piece.find_by(id: params[:id])
    end

    def update
        @piece = Piece.find_by(id: params[:id])
        @piece.update(piece_params)
        redirect_to piece_path(@piece)
    end

    def delete
        @piece = Piece.find_by(id: params[:id])
        @piece.delete
        redirect_to piece_path(@piece)
    end

    private

    def piece_params
        params.require(:piece).permit(:title, :artist, :description, :medium, :dimensions, :weight, :location, :provenance, :appraised_value, :notes, :treatment[:id], :treatment[:decription, :date_time])
    end
end
