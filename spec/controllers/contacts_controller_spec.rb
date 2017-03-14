require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'POST#import' do
    it "redirects to the '/contacts' view" do
      allow(Contact).to receive(:import).with('filename.csv')
      post :import, file: 'filename.csv'
      expect(response).to redirect_to '/contacts'
    end

    it 'displays a flash notice when contacts upload successfully' do
      allow(Contact).to receive(:import).with('filename.csv')
      post :import, file: 'filename.csv'
      expect(flash[:success]).to eq('Contacts Successfully Uploaded!')
    end

    it 'imports a csv file' do
      expect(Contact).to receive(:import).with('filename.csv')
      post :import, file: 'filename.csv'
    end
  end

  describe 'GET#index' do
    it 'displays all contacts' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
