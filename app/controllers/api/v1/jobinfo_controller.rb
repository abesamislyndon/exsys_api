module Api
    module V1
        class JobinfoController < Api::ApplicationController
         
            before_action :authenticate_request!
        
        def index       
            @alljobinfo = Jobinfo.all 
            render json: @alljobinfo, status: 201    
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
            params.require(:jobinfo).permit(:client_name, 
                                            :division_name, 
                                            :block, 
                                            :address, 
                                            :natureofcomplain, 
                                            :dateEntry, 
                                            defect_details_attributes: [:id, :jobinfo_id, :defects, :recommendation,:_destroy],
                                            partsreplace_attributes: [:id, :jobinfo_id, :item, :sorcode, :rates, :quantity, :subtotal,:_destroy]
                                        )
        end

        end
    end
end