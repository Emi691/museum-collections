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
        @treatment.conditions.build(piece_id: params[:piece_id])
    end

    def create
        binding.pry
        @treatment = Treatment.create(treatment_params)  
        if @treatment.save
            redirect_to treatment_path(@treatment)
        else
            render :new
        end
    end
    
    def show
        @treatment = Treatment.find_by(id: params[:id])
    end

    private

    def treatment_params
        params.require(:treatment).permit(:description, :date_time, conditions_attributes: [:treatment_id, :piece_id, :description, :date_time])
    end
end