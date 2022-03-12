require 'rails_helper'

RSpec.describe Client, type: :model do


before(:all) do
      @clients = FactoryBot.create(:client_list)
end

  context "validations" do
     it { should validate_presence_of(:client_name)}
  end

  context " CRUD " do
      it 'checks client can be created' do
           expect(@clients).to be_valid
      end
 #     it 'checks if client can be read' do
 #        expect(Client.find_by_client_name('Giselle')).to eq(@clients)
 #     end
      it 'checks of client can be update' do
         @clients.update(:client_name=>'dondon')
         expect(Client.find_by_client_name('dondon')).to eq(@clients)
      end

      it 'checks of client if can be delete' do
         @clients.destroy
         expect(Client.find_by(client_name: 'dondon')).to be_nil
      end

   end
end