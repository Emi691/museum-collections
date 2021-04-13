class PiecesController < ApplicationController
   before_action :redirect_if_not_logged_in

    def index
        @artists = Piece.all_artists
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @pieces = @user.pieces   
        elsif !params[:artist].blank?
            @pieces = Piece.by_artist(params[:artist])
        elsif !params[:alphabetize].blank?

            if params[:alphabetize] == "A-Z"
            @pieces = Piece.alphabetical_by_title
            else
                @pieces = Piece.reverse_alphabetical_by_title
            end
        else
            @pieces = Piece.all
        end
    end

    def show 
        if @piece = Piece.find_by(id: params[:id])
            @user = current_user
            render :show
        else
            flash[:message] = "The piece you requested could not be found"
            redirect_to pieces_path
        end
    end

    def new
        @piece = Piece.new
        @pmuseum = Museum.new
    end

    def create
        @piece = Piece.new(piece_params)
        user_id = current_user.id
        @piece.user_id = user_id
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
        if @piece.update(piece_params)
        redirect_to piece_path(@piece)
        else
            render :edit
        end
    end

    def destroy
        @piece = Piece.find_by(id: params[:id])
        @piece.delete
        redirect_to pieces_path
    end

    private

    def piece_params
        params.require(:piece).permit(:user_id, :museum_id, :title, :artist, :description, :medium, :dimensions, :weight, :location, :provenance, :appraised_value, :notes)
    end
end
