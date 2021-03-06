    class Api::V1::ClientController  <  Api::ApplicationController

     before_action :authenticate_request!

      def index
            @client_all = Client.all
            render json: @client_all
        end 

        def new
          @client = client.new
        end

        def create
          @client = Client.create(client_params)
          render json: @client, status: 201
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
