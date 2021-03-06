require 'rails_helper'

RSpec.describe "Divisions", type: :request do

before(:all) do
    @divisions_list = FactoryBot.create(:division_list)
    @user = FactoryBot.create(:user)
end

def authenticated_header(user)
    token = JsonWebToken.encode({user_id: @user.id})
    { 'Authorization': "Bearer #{token}" }
end

describe "STATUS for CRUD" do
    # checks index status
    it 'check http status 200 api' do
        headers = {'ACCEPT'=>'application/json'}
         get '/api/v1/division', :headers => authenticated_header(@user)
        # expect(response.body).to have_http_status(200)
    end

    it 'return status after create divisions' do
        headers = {'ACCEPT'=>'application/json'}
        post '/api/v1/division', :params => 
            {:division=>
                    { client_id: @divisions_list.client_id,  div_name: @divisions_list.div_name, div_short: @divisions_list.div_short}
            }, :headers => authenticated_header(@user)
        expect(response.status).to eq(201)
    end

    it 'returns status after edit divisions' do
        headers = {'ACCEPT'=>'application/json'}
        put "/api/v1/division/#{@divisions_list.id}", :params =>
        {
            :division=>{
                client_id: @divisions_list.client_id,
                div_name: @divisions_list.div_name,
                div_short: @divisions_list.div_short
            }
        }, :headers => authenticated_header(@user)
        expect(response.status).to eq(202)
    end

    it 'return status after delete division' do
        headers = {'ACCEPT' => 'application/json'}
        delete "/api/v1/division/#{@divisions_list.id}" , :headers => authenticated_header(@user)
        expect(response.status).to eq(204)
    end

    it 'returns status after show division' do
        headers = {'ACCEPT' => 'applicaiton/json'}
        get "/api/v1/division/#{@divisions_list.id}",
        :headers => authenticated_header(@user)
        expect(response.status).to eq(200)
    end
 end
 
end 