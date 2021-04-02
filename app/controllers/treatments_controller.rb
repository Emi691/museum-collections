class TreatmentsController < ApplicationController

    def index
        if params[:piece_id]
            @piece = Piece.find_by(id: params[:piece_id])
        else
            @treatements = Treatment.all
        end
    end
    
    def show
        @treatement = Treatment.find_by(id: params[:id])
    end
end