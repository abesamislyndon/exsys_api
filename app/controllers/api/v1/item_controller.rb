module Api
    module V1
        class ItemController < Api::ApplicationController
            before_action :authenticate_request!

            def index  
                @item = Item.all
                 render json: @item
            end

            def show
                @item = item.find(params[:id])
                render json: @item, status: 200
            end

           # def new
           ##     @item = Division.new
            #end

            #def create
            #    @division = Division.create(params_division)
            #    render json: @division, status: 201 if @division.save!      
            #end

            #def edit
            #    @division = Division.find(params[:id])                
            #end

            #def update
            #    @division_update = Division.update(params_division)
            #    render json: @division_update , status: 202       
            #end

            #def destroy
             #   @division_delete = Division.find(params[:id])
              #  @division_delete.destroy
             #   render json: @division_delete, status: 204
            #end

            #def divbelong
             #   @selectClient = Division.client_division(params[:id])
             #   render json: @selectClient
           # end

            #private

           # def params_division
            #    params.require(:division).permit(:client_id, :div_name, :div_short)               
            #end

        end 
    end 
end

