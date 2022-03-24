module Api
    module V1
        class DefectDetailsController < Api::ApplicationController
            before_action :authenticate_request!

            def index 
            end

            def show
            end

            def new
            end

            def create     
            end

            def edit
            end

            def update
            end

            def destroy
                @DefectDetail = DefectDetail.find(params[:id])
                @DefectDetail.destroy
                render json: @DefectDetail, status: 204
            end

        

            private

            def params_division
                params.require(:division).permit(:client_id, :div_name, :div_short)               
            end

        end 
    end 
end

