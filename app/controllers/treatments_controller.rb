class TreatmentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @treatment = Treatment.new
        @treatment.conditions.build(piece_id: params[:piece_id])
    end

    def create
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