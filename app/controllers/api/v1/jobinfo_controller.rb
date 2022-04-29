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
        #
       def create
                jobinfo = Jobinfo.create(params_jobinfo) 
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
                  jobinfo = Jobinfo.find(params[:id])
                  #jobinfo.update(photo: params[:photo])
                  #photo_url = rails_blob_path(jobinfo.photo)
                 if jobinfo.update!(params_jobinfo) 
                     render json: jobinfo,  status: 201 
                 end                 
            end

            def destroy
                @jobinfo = Jobinfo.find(params[:id])
                @jobinfo.destroy
                render json: @jobinfo, status: 204
            end


            def total_amount 
                @total_amount = Jobinfo.total_amount
                render json: @total_amount, status: 200
            end

            def completed_jobwork
                completed_jobwork = Jobinfo.completed_jobwork
                render json: completed_jobwork, status: 201
            end

            def completed_jobwork_personnel
                userid = current_user.id
                completed_jobwork_personnel = Jobinfo.completed_jobwork_personnel(userid)
                render json: completed_jobwork_personnel, status: 201
            end


            def outstanding_jobwork_personnel
                userid = current_user.id
                outstanding_jobwork_personnel = Jobinfo.outstanding_jobwork_personnel(userid)
                render json: outstanding_jobwork_personnel, status: 201
            end

            def total_count_personnel_outstanding 
                userid = current_user.id
                @total_count_personnel_outstanding = Jobinfo.total_count_personnel_outstanding(userid)
                render json: @total_count_personnel_outstanding, status: 200
            end

            def total_count_personnel_done
                userid = current_user.id
                @total_count_personnel_done = Jobinfo.total_count_personnel_done(userid)
                render json: @total_count_personnel_done, status: 200
            end

            def monthly_total_outstanding_chart
               outstanding_monthly_client = Jobinfo.outstandingchart.map(&:values)
               render json: outstanding_monthly_client
            end

            def monthly_total_outstanding_chart_count
                outstanding_monthly_client_count = Jobinfo.outstandingchartcount.map(&:values)
                render json: outstanding_monthly_client_count
            end

            def generatereport
               client_name =  params[:client_name]
               status = params[:status]
               datefrom = params[:datefrom] 
               dateto = params[:dateto]
                @generatereport = Jobinfo.generatereport(client_name, status, datefrom, dateto)
                render json: @generatereport, status: 200
            end

            private

            def params_jobinfo
                params.require(:jobinfo).permit(:id,    
                                                :client_name, 
                                                :client_id,
                                                :division_name, 
                                                :block, 
                                                :address, 
                                                :natureofcomplain, 
                                                :dateentry, 
                                                :gtotal,
                                                :status,
                                                :userid,
                                                :photo,
                                                :defect_details_attributes => 
                                                        [:id, 
                                                        :jobinfo_id, 
                                                        :defects, 
                                                        :recommendation],
                                                :partsreplaces_attributes=>[:id, :jobinfo_id, :sorcode, :quantity, :item, :rates, :subtotal,:_destroy]
                )
            end

          
       
        end    
    end
end