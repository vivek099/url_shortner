require 'rails_helper'

RSpec.describe UrlMappersController, type: :controller do
  describe "POST #create" do
    context 'when request is valid' do
      let(:params) {
        {
          long_url: 'http://this.is.a.mock.url'
        }
      }
      it 'creates and returns new short URL with 201 response code' do
        get :create, params: params
        expect(response).to be_successful
      end
    end

    context 'when long_url length < 15 characters' do
      let(:params) {
        {
          long_url: 'http://dummy'
        }
      }
      it 'returns 400 error' do
        get :create, params: params
        expect(response.status).to eq(400)
      end
    end

    context 'when long_url is empty' do
      let(:params) {
        {
          long_url: ''
        }
      }
      it 'returns 400 error' do
        get :create, params: params
        expect(response.status).to eq(400)
      end
    end
  end

  describe "GET #index" do
    context 'when request is successful' do
      it 'returns list of urls with 200 response code' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end
  end
end
