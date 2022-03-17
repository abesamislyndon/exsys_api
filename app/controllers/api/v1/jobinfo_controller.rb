module Api
    module V1
        class JobinfoController < Api::ApplicationController
         
            before_action :authenticate_request!
            
        
         def index       
            @alljobinfo = Jobinfo.all
            render json: @alljobinfo, status: 201    
         end


         def show
               @job = Jobinfo.find(params[:id]) 
            if @job

                render json: @job , status: 201 
            end             
         end

            def new
                @jobinfo = Jobinfo.new
            end

            def create
                @jobinfo = Jobinfo.create(params_jobinfo)
                render json: @jobinfo, status: 201 if @jobinfo.save!
            end



           # def update
           #     @jobinfo = Jobinfo.update(params_jobinfo)
            #    render json: @jobinfo, status: 201 if @jobinfo.save!
            #end


               # GET method for editing a product based on id
            def edit
                @jobinfo = Jobinfo.find(params[:id])
            end
            
            # PUT method for updating in database a product based on id
            def update
                @jobinfo = Jobinfo.find(params[:id])
                  if @jobinfo.update_attributes!(params_jobinfo)
                    render json: @jobinfo, status: 201 
                 end
            end

            def total_amount 
                @total_amount = Jobinfo.total_amount
                render json: @total_amount, status: 200
            end

            private

            def params_jobinfo
                params.require(:jobinfo).permit(:client_name, 
                                                :division_name, 
                                                :block, 
                                                :address, 
                                                :natureofcomplain, 
                                                :dateEntry, 
                                                :gtotal,
                                                :defect_details_attributes => 
                                                        [:id, 
                                                        :jobinfo_id, 
                                                        :defects, 
                                                        :recommendation, 
                                                        :photo],
                                                partsreplaces_attributes: [:id, :jobinfo_id, :sorcode, :quantity, :item, :rates, :subtotal,:_destroy]
                )
            end
       
        end    
    end
end