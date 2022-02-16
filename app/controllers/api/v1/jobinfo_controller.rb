module Api
    module V1
        class JobinfoController < Api::ApplicationController
         
            before_action :authenticate_request!
        
        def index            
        end

        def new
            @jobinfo = Jobinfo.new
        end

        def create
            @jobinfo = Jobinfo.create(params_jobinfo)
            render json: @jobinfo, status: 201 if @jobinfo.save!
        end
        
        
        private

        def params_jobinfo
            params.require(:jobinfo).permit(:client_name, :division_name, :block, :address, :natureofcomplain, :dateEntry)
        end

        end
    end
end