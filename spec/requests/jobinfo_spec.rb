require 'rails_helper'

RSpec.describe "Jobinfos", type: :request do 

before(:all) do
    @Jobinfo = FactoryBot.create(:jobinfo)
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
end
 

end