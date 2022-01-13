module Api
    module V1
        class DivisionController < Api::ApplicationController
            def index  
                @division = Division.all
                 render json: @division
            end

            def show
                @division = Division.find(params[:id])
                render json: @division, status: 200
            end

            def new
                @division = Division.new
            end

            def create
                @division = Division.create(params_division)
                render json: @division, status: 201 if @division.save!      
            end

            def edit
                @division = Division.find(params[:id])                
            end

            def update
                @division_update = Division.update(params_division)
                render json: @division_update , status: 202       
            end

            def destroy
                @division_delete = Division.find(params[:id])
                @division_delete.destroy
                render json: @division_delete, status: 204
            end


            private

            def params_division
                params.require(:division).permit(:client_id, :div_name, :div_short)               
            end

        end 
    end 
end

