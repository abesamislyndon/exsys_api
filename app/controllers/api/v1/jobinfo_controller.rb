module Api
    module V1
        class JobinfoController < Api::ApplicationController
         
        before_action :authenticate_request!
            
        
         def index       
            @alljobinfo = Jobinfo.outstanding
            render json: @alljobinfo, status: 201    
         end


         def show
            @job = Jobinfo.find(params[:id]) 
            render json: @job , status: 201 
        end
           
        def new
                @jobinfo = Jobinfo.new
     end

            def create
                jobinfo = Jobinfo.create(params_jobinfo)
                #render json: @jobinfo, status: 201 if @jobinfo.save!
                

                if jobinfo.save
                    render json: jobinfo, status: 201
                  else
                    render json: jobinfo, status: :unprocessable_entity
                  end
            end

            def edit
                @jobinfo = Jobinfo.find(params[:id])
            end
            
            # PUT method for updating in database a product based on id
            def update
                @jobinfo = Jobinfo.find(params[:id])
                  if @jobinfo.update!(params_jobinfo) 
                    render json: @jobinfo, status: 201 
                 end                 
            end

            def total_amount 
                @total_amount = Jobinfo.total_amount
                render json: @total_amount, status: 200
            end

            def completed_jobwork
                completed_jobwork = Jobinfo.completed_jobwork
                render json: completed_jobwork, status: 201
            end

            private

            def params_jobinfo
                params.require(:jobinfo).permit(:client_name, 
                                                :client_id,
                                                :division_name, 
                                                :block, 
                                                :address, 
                                                :natureofcomplain, 
                                                :dateEntry, 
                                                :gtotal,
                                                :status,
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