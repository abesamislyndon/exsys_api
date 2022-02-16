require 'rails_helper'

RSpec.describe "Jobinfos", type: :request do 

before(:all) do
    @Jobinfo = FactoryBot.create(:jobinfo)
    @user = FactoryBot.create(:user)
end

def authenticated_header(user)
    token = JsonWebToken.encode({user_id: @user.id})
    { 'Authorization': "Bearer #{token}" }
end

context "CRUD process" do
    it "response status" do
        get '/api/v1/jobinfo'
        expect(JSON.parse(response.body).size).to eq(1)
     end  
     
     it 'returns status after creating jobinfo' do
        headers = { 'ACCEPT'=>'application/json'}
        post '/api/v1/jobinfo', 
        :params => {:jobinfo=>
                    {dateEntry: "12-12-22", 
                         client_name: 'SAMPLE', 
                         division_name: "CDO",
                          block: "12", 
                          address:"balulang",
                          natureofcomplain: "ok na unta"
                          }} , :headers =>  authenticated_header(@user)
        expect(response).to have_http_status(201)
     end


end
 

end