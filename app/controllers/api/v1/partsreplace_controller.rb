module Api
    module V1
        class PartsreplaceController < Api::ApplicationController
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
                @Partsreplace = Partsreplace.find(params[:id])
                @Partsreplace.destroy
                render json: @Partsreplace, status: 204
            end

            def divbelong
                @selectClient = Division.client_division(params[:id])
                render json: @selectClient
            end

            private

            def params_division
                params.require(:division).permit(:client_id, :div_name, :div_short)               
            end

        end 
    end 
end

