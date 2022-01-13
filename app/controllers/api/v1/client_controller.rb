module Api
 module V1
    class ClientController < Api::ApplicationController
        def index
            client_all = Client.all
            render json: client_all
        end 

        def new
          @client = client.new
        end

        def create
          @client = Client.create(client_params)
          render json: @client, status: 201 if @client.save!
        end

        def edit
            @client = Client.find(params[:id])          
        end

        def update
            @client = Client.update(client_params)
            render json: @client, status: 202           
        end

        def  destroy
          @client = Client.find(params[:id])
            if @client.destroy
              render json: @client, status: 204
            else
              render json: @client, status: 'cannot find id'
            end  
        end


       private

       def client_params
         params.require(:client).permit(:client_name)
       end
   
    end 
  end
end
