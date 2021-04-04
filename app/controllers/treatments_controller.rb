class TreatmentsController < ApplicationController

    def index
        if params[:piece_id]
            @piece = Piece.find_by(id: params[:piece_id])
        else
            @treatements = Treatment.all
        end
    end

    def new
        @treatment = Treatment.new
    end

    def create
        #binding.pry
        @treatement = Treatment.create(treatement_params)
        if @treatement.save
            redirect_to treatment_path(@treatement)
        else
            render :new
        end
    end
    
    def show
        @treatment = Treatment.find_by(id: params[:id])
    end

    private

    def treatement_params
        params.require(:treatment).permit(:description, :date_time, :piece_id)
    end
end