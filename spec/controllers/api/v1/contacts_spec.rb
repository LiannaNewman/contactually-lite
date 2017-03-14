require 'rails_helper'
require 'factory_girl'

RSpec.describe Api::V1::ContactsController, type: :controller do
  describe 'DELETE destroy' do
    before :each do
      @contact = FactoryGirl.create(:contact)
    end

    it 'deletes a contact' do
      expect{
        delete :destroy, id: @contact
      }.to change(Contact, :count).by(-1)
    end
  end
end
