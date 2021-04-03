class PiecesController < ApplicationController
   # before_action redirect_if_not_logged_in only (:create, :update, :delete)

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
        @user_id = current_user.id
        @museum_id = current_user.museums.first.id 
        @piece = Piece.new(piece_params)
        @piece.user_id = @user_id
        @piece.museum_id = @museum_id
        if @piece.save
            redirect_to piece_path(@piece)
        else
            render :new
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
        redirect_to pieces_path
    end

    private

    def piece_params
        params.require(:piece).permit(:user_id, :museum_id, :title, :artist, :description, :medium, :dimensions, :weight, :location, :provenance, :appraised_value, :notes, treatments_attributes: [:description, :date_time])
    end
end
