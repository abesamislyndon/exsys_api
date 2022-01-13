require 'rails_helper'

RSpec.describe "Clients", type: :request do 
   
   before  do
      @client = FactoryBot.create(:client_list) 
   end

   context " CRUD Status for Client" do
      it "response status" do
         get '/api/v1/client'
         expect(JSON.parse(response.body).size).to eq(1)
      end 

      it 'returns status after creating client' do
         headers = { 'ACCEPT'=>'application/json'}
         post '/api/v1/client', :params => {:client=>{ client_name:'gily'}}, :headers => headers
         expect(response).to have_http_status(201)
      end

      it 'updates a client' do
         @client_new = Faker::Name.name
         headers = { 'ACCEPT'=>'application/json'}
         put "/api/v1/client/#{@client.id}", :params => {:client=>{client_name: @client_new}}, :headers => headers
         expect(response.status).to eq(202)
         expect(Client.find(@client.id).client_name).to eq(@client_new)
       end

       it 'delete a client' do
          headers = { 'ACCEPT'=>'application/json'}
          delete "/api/v1/client/#{@client.id}", :headers => headers
          expect(response.status).to eq(204)
       end

   end


end
